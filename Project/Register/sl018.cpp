#include "sl018.h"

#include <QDebug>
#include <QTimer>

#include "reader.h"


Reader reader;



SL018::SL018(QObject *parent) : QObject(parent)
{
    reader.led();
}

void SL018::readCards()
{

    QString r = reader.readUID();
    if(r=="-1"){
        senderId(reader.readUID());
    }else{
        senderId(r);
    }


}

