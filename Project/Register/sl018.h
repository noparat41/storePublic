#ifndef SL018_H
#define SL018_H

#define SIZE_PACKET 19

#include <QObject>
#include "reader.h"


class SL018 : public QObject
{
    Q_OBJECT

public:
    explicit SL018(QObject *parent = nullptr);
//    void led();


public slots:
    void readCards();


signals:
    void senderId(QString id);
    void showTime();


private:
    bool status;
    bool ledState;
    int count;

    void reading();
};

#endif // SL018_H




