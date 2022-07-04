#ifndef SERVICE_H
#define SERVICE_H

#include <QObject>

#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>


class Service : public QObject
{
    Q_OBJECT
public:
    explicit Service(QObject *parent = nullptr);
    //CRUD
    Q_INVOKABLE void postKeyCards(QJsonObject obj);
    Q_INVOKABLE void getKeyCards();

public slots:

signals:
    void senderDataService(QJsonObject data,int status);
    void senderErrorService(QString manager,int status);

private:
    QNetworkAccessManager * manager;
    QNetworkReply * reply;
    QByteArray * dataBuffer;

private slots:
    void dataReadyRead();
    void dataReadFinished();
};

#endif // SERVICE_H
