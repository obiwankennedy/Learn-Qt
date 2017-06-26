import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Les animations"

    ListModel {
        id: listSection
        ListElement {
            name: "Animer une propriété"
            index:0
        }
        ListElement {
            name: "Type: PropertyAnimation, NumberAnimation,RotationAnimation, ColorAnimation "
            index:1
        }
        ListElement {
            name: "Animation Directe"
            index:2
        }
        ListElement {
            name: "Corportementale"
            index:4
        }
        ListElement {
            name: "Transition"
            index:6
        }
        ListElement {
            name: "Animations Séquentielles ou en Parallèles"
            index:8
        }
        ListElement {
            name: "Exercice: faire bouger les carrés vers dans le sens horaires (sur un seul axe)<br/>En parallèle puis en sequentiel"
            index:10
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
            slideCode.code ="MouseArea {
        anchors.fill: parent
        onClicked: {
            animateColor.start()
        }
    }

    PropertyAnimation {id: animateColor; target: my_rectangle; properties: \"color\"; to: \"green\"; duration: 100}"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="Behavior on opacity {
        NumberAnimation { duration: 1000 }
    }"
            view.opacity = 0
        }
        else if(idState == 7)
        {
            slideCode.visible = true;
            slideCode.code ="transitions: [
        Transition {
            NumberAnimation { properties: \"x,y\" }
        }
    ]
";
            view.opacity = 0
        }
        else if(idState == 9)
        {
            slideCode.visible = true;
            slideCode.code ="SequentialAnimation {
        id: anim
        NumberAnimation { target: bullet; property: \"x\"; from: 0; to: 200; duration: 500 }
        NumberAnimation { target: enemy; property: \"opacity\"; from: 1.0; to: 0; duration: 500 }
    }
";
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
