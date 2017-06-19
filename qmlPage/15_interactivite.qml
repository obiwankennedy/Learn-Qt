import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Interaction"

    ListModel {
        id: listSection
        ListElement {
            name: "Souris"
            index:0
        }
        ListElement {
            name: "Gesture: PinchArea, MultiPointTouchArea"
            index:1
        }
        ListElement {
            name: "Clavier"
            index:2
        }
        ListElement {
            name: "autres: C++"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    onIdStateChanged: {
        if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="Keys.onPressed: {
        if (event.key == Qt.Key_Left) {
            console.log(\"move left\");
            event.accepted = true;
        }
    }"
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
