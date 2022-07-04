#include "gpio.h"
#include <iostream>

#include <poll.h>
//#include <cstring>
#include <fcntl.h>
#include <zconf.h>
#include <QDebug>

Gpio::Gpio(QObject *parent) : QObject(parent),
    strGpioPathBase("/sys/class/gpio"),
    currentValue(0),
    pollingThread(NULL),
    pin(219)
{

}

Gpio::Gpio(const int gpioPin, const int threshold) :
    threshold(threshold),
    strGpioPathBase("/sys/class/gpio"),
    currentValue(0),
    pollingThread(NULL),
    pin(gpioPin)
{

}

Gpio::~Gpio() {

}

//***********************************************************************************************************************************

int Gpio::init()
{

//    qDebug() << "init";
    std::stringstream path;
    path << strGpioPathBase.str() << "/export";

    std::ofstream gpio(path.str(), std::ofstream::out);

    //    qDebug() << gpio.is_open();
    if(gpio.is_open()) {

        gpio << pin; // export gpio with the pin
        gpio.flush();
        gpio.close();
        return readValue(); // read to get current value of this gpio pin
        //worker();

    } else {
        std::stringstream msg;
        msg << "Gpio pin " << path.str() << " cannot open.";
        //        throw GpioException(msg.str());

        throw std::runtime_error(msg.str());
        qDebug() << "error!";
    }
    return -1;
}

void Gpio::setEdge(Gpio::Edge edge)
{
    std::stringstream path;
    path << strGpioPathBase.str() << "/gpio" << this->pin << "/edge";
    std::ofstream gpio(path.str());

    if(gpio.is_open()) {
        switch(edge) {
        case NONE:
            gpio << "none";
            break;
        case RISING:
            gpio << "rising";
            break;
        case FALLING:
            gpio << "falling";
            break;
        case BOTH:
            gpio << "both";
            break;
        default:
            gpio << "none";
            break;
        }
        gpio.flush();
        gpio.close();
    } else {
        std::stringstream msg;
        msg << "Cannot set gpio edge. Gpio pin " << pin << " is not open yet.";
        //          throw GpioException(msg.str());
        throw std::runtime_error(msg.str());
    }
}

int Gpio::readValue()
{
    //std::cout << "Read value\n";
//    qDebug() << "readValue";
    //    qDebug()<<"pin:"<<pin;

    setDirection(Direction::IN);
    std::stringstream path;

    path << strGpioPathBase.str() << "/gpio" << this->pin << "/value";
    std::ifstream gpio(path.str(), std::ofstream::in);

    char buffer[1];

    if(gpio.is_open()) {
        gpio.read(buffer, 1);
        gpio.close();

        int tmp = atoi(buffer);
        currentValue = tmp;
        //        qDebug() << "active_low:" << !currentValue;

        return !currentValue; // Active low
    } else {
        std::stringstream msg;
        msg << "Cannot read value. Gpio pin " << pin << " is not open yet.";
        //          throw GpioException(msg.str());
        throw std::runtime_error(msg.str());
        qDebug() << "error";
    }
}

void Gpio::writeValue(int value)
{
    setDirection(Direction::OUT);
    std::stringstream path;
    path << strGpioPathBase.str() << "/gpio" << this->pin << "/value";
    std::ofstream gpio(path.str(), std::ofstream::out);
    if(gpio.is_open()) {
        gpio << value;
        gpio.flush();
        gpio.close();
    } else {
        std::stringstream msg;
        msg << "Cannot write value. Gpio pin " << pin << " is not open yet.";
        //           throw GpioException(msg.str());
        throw std::runtime_error(msg.str());
    }
}

//***********************************************************************************************************************************

int Gpio::getPin() const
{
    return pin;
}

void Gpio::setPin(const int pin)
{
    this->pin = pin;
}

//***********************************************************************************************************************************

bool Gpio::operator==(const Gpio &rhs) const
{
    return pin == rhs.pin;
}

bool Gpio::operator!=(const Gpio &rhs) const
{
    return !(rhs.pin == pin);
}

//***********************************************************************************************************************************

int Gpio::getCurrentValue() const
{
    return currentValue;
}

std::string Gpio::getValuePath() const
{
    std::stringstream path;
    path << strGpioPathBase.str() << "/gpio" << this->pin << "/value";
    //     path << strGpioPathBase.str() << "/gpio" << this->pin << "/active_low";

    return path.str();
}

void Gpio::waitForValue()
{
    pollingThread = new std::thread(std::bind(&Gpio::worker, this));
}

void Gpio::setThreshold(int value)
{
    threshold = value;
}

//***********************************************************************************************************************************

void Gpio::setDirection(Gpio::Direction direction)
{
    this->direction = direction;
    std::stringstream path;
    path << strGpioPathBase.str() << "/gpio" << this->pin << "/direction";
    std::ofstream gpio(path.str());

    if(gpio.is_open()) {
        if(direction == IN) {
            gpio << "in";
        } else if(direction == OUT) {
            gpio << "out";
        }
        gpio.flush();
        gpio.close();
    } else {
        std::stringstream msg;
        msg << "Cannot set gpio direction. Gpio pin " << path.str() << " is not open yet.";
        //            throw GpioException(msg.str());
    }
}


void Gpio::worker()
{
    struct pollfd pfd;
    memset((void *) &pfd, 0, sizeof(pfd));
    pfd.fd = open(getValuePath().c_str(), O_RDONLY);
    pfd.events = POLLPRI | POLLERR;

    while(1) {
        int ret = poll(&pfd, 1, -1);
        if(ret < 0) {
            if(pfd.events & POLLPRI) {
                std::this_thread::sleep_for(std::chrono::milliseconds (threshold)); // debounce
                lseek(pfd.fd, 0, SEEK_SET);
                char v;
                read(pfd.fd, &v, 1);
                int tmp = atoi(&v);
                currentValue = tmp;
                //                qDebug() << currentValue;
                emit valueChanged(currentValue);
            }
        }
        qDebug() << currentValue;
    }

}













