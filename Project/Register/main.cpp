#include <QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "service.h"
#include "sl018.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    Service service;
    SL018 sl018;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("Service",&service);
    engine.rootContext()->setContextProperty("SL018",&sl018);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
