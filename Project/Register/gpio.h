#ifndef GPIO_H
#define GPIO_H

#include <list>
#include <sstream>
#include <fstream>
#include <thread>
#include <QObject>


class Gpio : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int pin READ getPin WRITE setPin)
    Q_PROPERTY(int threshold WRITE setThreshold)


public:
    enum Direction {
        IN, OUT
    };
    Q_ENUM(Direction)

    enum Edge {
        NONE, RISING, FALLING, BOTH
    };
    Q_ENUM(Edge)

    explicit Gpio(QObject *parent = nullptr);
    Gpio(const int pin, const int threshold);
    virtual ~Gpio();

    Q_INVOKABLE int init();
    Q_INVOKABLE void setEdge(Edge edge);
    Q_INVOKABLE int readValue();
    Q_INVOKABLE void writeValue(int value);

    int getPin() const;
    void setPin(const int pin);

    Q_INVOKABLE int getCurrentValue() const;
    std::string getValuePath() const;
    Q_INVOKABLE void waitForValue();

    bool operator==(const Gpio &rhs) const;
    bool operator!=(const Gpio &rhs) const;

    void setThreshold(int value);

    void worker();

signals:
    void valueChanged(const int val);

private:
    Direction direction;
    std::thread *pollingThread;
    std::stringstream strGpioPathBase;
    int threshold;
    int currentValue;
    int pin;

    void fireValueChanged(const int val);
    void setDirection(Direction direction);
//        void worker();

};

#endif // GPIO_H
