#include "reader.h"

#include "QDebug"

#include <linux/i2c.h>
#include <linux/i2c-dev.h>

#include "reader.h"

#include "gpio.h"
Gpio gpio;


Reader::Reader(QObject *parent) : QObject(parent)
  ,ledState(true)
{

}


void Reader::led()
{
    //    qDebug() << "sendCommand LED";

    int file;
    int pin = 4;
    char filename[20];

    snprintf(filename, 19, "/dev/i2c-%d", pin);
    //    qDebug() << filename << O_RDWR;

    file = open(filename, O_RDWR);
    if (file < 0) {
        qDebug() << "error! file";
        exit(1);
    }

    int addr = 0x50;

    if (ioctl(file, I2C_SLAVE, addr) < 0) {
        qDebug() << "error! ioctl";
        exit(1);
    }


    if(ledState){
        write(file, SL018CMD_ComRedLedOn, 3);
        qDebug() << "ON";
        ledState=!ledState;
    }
    //    else{
    //        write(file, SL018CMD_ComRedLedOff, 3);
    //        qDebug() << "OFF";
    //    }


}



QString Reader::readUID()
{
//    qDebug() << "readUID";

    int file;
    int pin = 4;
    char filename[20];

    snprintf(filename, 19, "/dev/i2c-%d", pin);

    file = open(filename, O_RDWR);
    if (file < 0) {
        qDebug() << "error! path";
        exit(1);
    }

    int address = 0x50;

    if (ioctl(file, I2C_SLAVE, address) < 0) {
        qDebug() << "error! address";
        exit(1);
    }

    unsigned char buf[20];
    buf[0] =0x01;

    int pos = 0;
    char printbuf[7];


    while (true) {

        //   delays.run();

        if(write(file,buf,1)==1){
            if(read(file, buf, 11)==11){
                qDebug() << "Select Card!";

                if(gpio.init()){
                    if(buf[10]==0){
                        qDebug() << "String!";
                        return "-1";
                    }else{
                        int i=0;
                        for(i=3;i<10;i++){
                            pos += sprintf(&printbuf[pos], "%02hhx", buf[i]);
                        }
                        for(i=0;i<14;i++){
                            if(printbuf[i]>='a'&&printbuf[i]<='z'){
                                printbuf[i]= toupper(printbuf[i]);
                            }

                        }
                        return printbuf;
                    }
                }
                else{
                    return "";
                }

                qDebug() << printbuf;
                break;

            }
        }
    }

}

