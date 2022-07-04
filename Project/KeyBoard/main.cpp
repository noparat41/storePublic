#include <QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    arm view(QString("qrc:/%2").arg(MAIN_QML));

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}


//#include <QQuickView>
//#include <QGuiApplication>
//#include <QQmlEngine>

//int main(int argc, char *argv[])
//{
//    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

//    QGuiApplication app(argc, argv);
//    QQuickView view(QString("qrc:/%2").arg(MAIN_QML));
//    if (view.status() == QQuickView::Error)
//        return -1;
//    view.setResizeMode(QQuickView::SizeRootObjectToView);

//    view.show();

//    return app.exec();
//}
