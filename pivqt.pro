TEMPLATE = app

QT += qml quick widgets 3dinput

CONFIG += c++11

SOURCES += main.cpp \
    qmlcontroler.cpp \
    cpphighlighter.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = pages

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += pages/*.qml *.qml qmlPage/*.qml

HEADERS += \
    qmlcontroler.h \
    cpphighlighter.h

FORMS += \
    qmlcontroler.ui

TRANSLATIONS =  translations/qtpiv_fr.ts

DISTFILES += \
    qmlPage/CameraController.qml \
    qmlPage/09_badExample.qml \
    rsrc/heritage_animation.jpg


