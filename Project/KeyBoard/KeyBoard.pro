QT += quick

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp

RESOURCES += qml.qrc


QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


#***********************************************************************************888

#QT -= quick

#TEMPLATE = lib
#CONFIG += staticlib

#CONFIG += c++11

#DEFINES += QT_DEPRECATED_WARNINGS


#SOURCES += \
#        main.cpp

#RESOURCES += qml.qrc


#unix {
#    target.path = $$[QT_INSTALL_PLUGINS]/generic
#}
#!isEmpty(target.path): INSTALLS += target
