import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Les animations"
    property bool runAnimation : false

    onIdStateChanged: {
        if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="Rectangle {
    NumberAnimation on x { from: 0; to: 100; duration: 500 }
}"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }
"
            view.opacity = 0
        }
        else if(idState == 10)
        {
            slideCode.visible = true;
            slideCode.code ="
    Rectangle {
        id: rect
    }
    NumberAnimation {id:moveAnim; target: rect; from: 0; to: 100; duration: 500 }
    [...]
    MouseArea {
        onClicked: moveAnim.start()
    }
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

    ListModel {
        id: listSection
        ListElement {
            name: "Rappel Chapitre 4"
            index:0
        }
        ListElement {
            name: "Les types d'animations"
            index:1
        }
        ListElement {
            name: "Les propriétés des animations?"
            index:2
        }
        ListElement {
            name: "Les différentes méthodes"
            index:4
        }
        ListElement {
            name: "L'opérateur on"
            index:5
        }
        ListElement {
            name: "Corportementale"
            index:7
        }
        ListElement {
            name: "Animation Directe"
            index:9
        }
        ListElement {
            name: "Transition"
            index:11
        }
        ListElement {
            name: "Animations Séquentielles ou Parallèles"
            index: 12
        }
        ListElement {
            name: ""
            index: 13
        }
        ListElement {
            name: "Exercice: faire bouger les carrés vers dans le sens horaire (sur un seul axe)<br/>En parallèle puis en sequentiel"
            index:13
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    ListModel {
        id: curve
        ListElement {
            type: Easing.Linear
            mcolor: "red"
            img: "http://doc.qt.io/qt-5/images/qeasingcurve-linear.png"
        }
        ListElement {
            type: Easing.OutBack
            mcolor: "steelblue"
            img: "http://doc.qt.io/qt-5/images/qeasingcurve-outback.png"
        }
        ListElement {
            type: Easing.OutBounce
            mcolor: "green"
            img: "http://doc.qt.io/qt-5/images/qeasingcurve-outbounce.png"
        }
    }

    Image {
        source: "qrc:/rsrc/heritage_animation.jpg"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: idState == 1
        fillMode: Image.PreserveAspectFit
        width: 700
    }

    RowLayout {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: idState == 3
        width: 400
        Repeater {
            model: curve
            Item {
                id: showroom
                width: 50
                height: rectangle1.height
                Layout.alignment : Qt.AlignTop | Qt.AlignLeft

                PropertyAnimation {
                    id: animation
                    duration: 2000
                    target: ball
                    property: "y"
                    running: rectangle1.runAnimation
                    onStopped: rectangle1.runAnimation = false
                    from: 0
                    to: rectangle1.height-150
                    easing.type: type
                }

                Rectangle {
                    id: ball
                    x: 10
                    y: 25
                    color: mcolor
                    radius: 25
                    width: 50
                    height: 50
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rectangle1.runAnimation = true
                            console.log("click on bullet")
                        }
                    }
                }

                Image {
                    x:0
                    y: rectangle1.height-100
                    height: 100
                    width: 100
                    fillMode: Qt.KeepAspectRatio
                    source: img
                }

            }
        }
    }


}
