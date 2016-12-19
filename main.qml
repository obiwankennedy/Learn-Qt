import QtQuick 2.5

import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import Qt.labs.presentation 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: app
    visibility: Window.FullScreen
    width: app.width
    height: app.height
    visible: true
    title: qsTr("PIV and Qt5: The love story!")
    property alias current: view.currentIndex

    onCurrentChanged: {
        //topcornerimage.visible = false
        //bottomcornerimage.visible = false
        if(current==0)
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        else if(current % 3 == 0)
        {
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        }
        else if(current % 3 == 1)
        {
            bgimg.source = "qrc:/rsrc/chaton.jpg";
        }
        else if(current % 3 == 2)
        {
            bgimg.source = "qrc:/rsrc/lionne.jpg";
           // topcornerimage.visible = true
        }
    }

    signal currentItemChanged(int current)
    ListModel {
            id: panelModel
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "Coding Rules"
            }
            ListElement {
                name: "Coding Rules"
                path: "02_codingRules.qml"
                time: 1
                next: "bad examples"
            }
            ListElement {
                name: "Coding Rules"
                path: "03_codingRules_bis.qml"
                time: 1
                next: "bad examples"
            }
            ListElement {
                name: "Bad Examples"
                path: "04_badExample.qml"
                time: 1
                next: "MVC"
            }
            ListElement {
                name: "MVC"
                path: "05_mvc.qml"
                time: 1
                next: "Events and Signals/Slots"
            }

            ListElement {
                name: "Events and Signals Slots"
                path: "06_events_and_slots.qml"
                time: 1
                next: "qthread"
            }
            ListElement {
                name: "QThread"
                path: "07_qthread.qml"
                time: 1
                next: "deployment"
            }
            ListElement {
                name: "Deployment"
                path: "08_deployment.qml"
                time: 1
                next: "Internationalisation"
            }
            ListElement {
                name: "Internationalisation"
                path: "09_internationalisation.qml"
                time: 1
                next: "Third Part"
            }
            ListElement {
                name: "Third Part"
                path: "10_third_part.qml"
                time: 1
                next: ""
            }

            ListElement {
                name: "Third Part"
                path: "11_Tcp_Socket.qml"
                time: 1
                next: ""
            }
            ListElement {
                name: "Misc"// JSON, Settings, c++11/14, drag and drop
                path: "12_misc.qml"
                time: 1
                next: ""
            }
            ListElement {
                name: "End"
                path: "12_end.qml"
                time: 1
                next: ""
            }
        }
    Image {
        id: bgimg
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/rsrc/graywood2.jpg"
        verticalAlignment: Image.AlignBottom
    }
    FastBlur {
        anchors.fill: bgimg
        source: bgimg
        radius: 32
        opacity: bgimg.opacity
    }
    onVisibleChanged: trigger.start()


    PathView {
        id: view
        anchors.fill: parent
        model: panelModel
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
            //property variant model: model
             source: "pages/"+path
             width: app.width
             height: app.height
             //anchors.fill: app.contentItem

        }
        /*delegate: Rectangle {
            width: app.width
            height: app.height
            color: colortxt
        }*/



        Timer {
            id: trigger
            interval: 10
            repeat: false
            onTriggered: app.currentItemChanged(view.currentIndex)
        }

        onOffsetChanged: {
            if(Math.floor(offset)===offset)
            {
                trigger.start()
            }
        }
        focus: true
        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed:{
            incrementCurrentIndex()
        }
        Keys.onEscapePressed: {
            if(app.visibility === Window.FullScreen)
            {
                app.visibility = Window.Windowed;
            }
            else
            {
                app.visibility = Window.FullScreen;
            }
        }

        path: Path {
            startX: view.width/2
            startY: view.height/2
            PathLine { x: view.width/2+view.width*panelModel.count; y: view.height/2 }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottomMargin: 50
        text: (view.currentIndex+1)+"/"+view.count
        visible: view.currentIndex>0 ? true : false
    }
    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        text: panelModel.get(view.currentIndex).next+">"
    }
}
