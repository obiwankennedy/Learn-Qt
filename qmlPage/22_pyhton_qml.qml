import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Python et QML"

    ListModel {
        id: listSection
        ListElement {
            name: "PySide2 (et PyQt5)"
            index:0
        }
        ListElement {
            name: "pip install PySide2"
            index:0
        }
        ListElement {
            name: "Hello world"
            index:1
        }
        ListElement {
            name: "Ajouter une proprieté"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    onIdStateChanged: {
        if(idState == 2)
        {
            slideCode.visible = true;
            slideCode.code ="[Python]
#!/usr/bin/python3
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

app = QGuiApplication([])
engine = QQmlApplicationEngine()
engine.load(\"view.qml\")

app.exec_()

// QML
import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    width: 200
    height: 200
    visible: true

    Text {
        text: \"Hello World\"
        anchors.centerIn: parent
    }
}
"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="// Camfeed.py
from PySide2.QtQuick import QQuickPaintedItem
from PySide2.QtGui import QPainter
from PySide2.QtCore import QObject

class RedRect(QQuickPaintedItem):
    def __init__(self, parent=None):
        super().__init__(parent)

    # Re-implementation of the virtual function
    def paint(self, painter):
        painter.drawRect(10,10,50,50)
[...]
# main.py
from RedRect import RedRect

if __name__ == '__main__':
    # Declare QApplication
    app = QApplication([])
    qmlRegisterType(RedRect.RedRect, 'RedRect', 1, 0, 'RedRect')
"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="

"
            view.opacity = 0
        }
        else
        {

            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
}
