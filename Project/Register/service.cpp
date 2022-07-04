#include "service.h"

#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include <QNetworkRequest>


Service::Service(QObject *parent) : QObject(parent),
    manager(new QNetworkAccessManager(this)),
    reply(nullptr),
    dataBuffer(new QByteArray)
{

}

void Service::postKeyCards(QJsonObject obj)
{
    qDebug() << obj;

    QNetworkRequest req;

    //    req.setUrl(QUrl("http://172.16.80.123:9094/api/v1/keycards"));
    req.setUrl(QUrl("https://6209cb1f92946600171c5508.mockapi.io/api/v1/keycards"));    // MOCKUP API
    req.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");

    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    reply = manager->post(req,data);

    connect(reply,&QIODevice::readyRead,this,&Service::dataReadyRead);
    connect(reply,&QNetworkReply::finished,this,&Service::dataReadFinished);
}

void Service::getKeyCards()
{
    reply = manager->get(QNetworkRequest(QUrl("http://api.icndb.com/jokes/random/")));  // API TEST
    connect(reply,&QIODevice::readyRead,this,&Service::dataReadyRead);
    connect(reply,&QNetworkReply::finished,this,&Service::dataReadFinished);
}

void Service::dataReadyRead()
{
    dataBuffer->append(reply->readAll());
}

void Service::dataReadFinished()
{
    QVariant statusCode = reply->attribute( QNetworkRequest::HttpStatusCodeAttribute );
    int status = statusCode.toInt();

    if(reply->error()){
        qDebug() <<"Error status: "<<status;
        qDebug() <<"There was some error : "<<reply->errorString();
        senderErrorService(reply->errorString(),status);
    }else{

        QJsonDocument doc = QJsonDocument::fromJson(*dataBuffer);
        QJsonObject data = doc.object();
        qDebug() << data;
        senderDataService(data,status);
        //        QJsonArray array = data["value"].toArray();

    }

}
