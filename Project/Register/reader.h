#ifndef READER_H
#define READER_H

#include <QObject>


#include <linux/types.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>

#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <QString>
#include <sstream>
#include <stdlib.h>

//#include "gpio.h"

class Reader : public QObject
{
    Q_OBJECT
    unsigned char SL018CMD_ComSelectCard[2]          = {1,1};
    unsigned char SL018CMD_ComLoginSector[10]        = {9,2,0+2,0xAA,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};

    unsigned char SL018CMD_ComReadBlock[3]          = {2,3,1+8};
    unsigned char SL018CMD_ComWriteBlock[19]         = {18,4,1+8,0x00,0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,0xAA,0xBB,0xCC,0xDD,0xEE,0xFF};

    unsigned char SL018CMD_ComIntiPurse[7]          = {6,6,1+8,0x78,0x56,0x34,0x12};
    unsigned char SL018CMD_ComReadPurse[3]          = {2,5,1+8};

    unsigned char SL018CMD_ComIncrPurse[7]          = {6,8,1+8,0x02,0x00,0x00,0x00};
    unsigned char SL018CMD_ComDecrPurse[17]          = {6,9,1+8,0x01,0x00,0x00,0x00};

    unsigned char SL018CMD_ComCopyValue[4]           = {3,0x0A,1+8,2+8};

    unsigned char SL018CMD_ComReadUltralightPage[3] = {2,0x10,0x05};
    unsigned char SL018CMD_ComWriteUltralightPage[7]= {6,0x11,0x05,0x12,0x34,0x56,0x78};

    unsigned char SL018CMD_ComRedLedOn[3]            = {2,0x40,1};
    unsigned char SL018CMD_ComRedLedOff[3]           = {2,0x40,0};

public:
    explicit Reader(QObject *parent = nullptr);
    void led();
    QString readUID();

    unsigned char address;
    std::stringstream path;

//    Gpio *_trigger;
//    bool _selectMifareCard();

signals:

private:
    bool ledState;


};

#endif // READER_H
