import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Properties et signaux"

    ListModel {
        id: listSection
        ListElement {
            name: "Les propriétés"
            index:0
        }
        ListElement {
            name: "Les importantes"
            index:1
        }
        ListElement {
            name: "Propagation (Opacité/visibilité)"
            index:2
        }
        ListElement {
            name: "notification"
            index:4
        }
        ListElement {
            name: "acces"
            index:5
        }
        ListElement {
            name: "Ajouter une propriété"
            index:6
        }
        ListElement {
            name: "Ajouter un alias"
            index:8
        }
        ListElement {
            name: "Exercice: Créer un item contenant deux rectangles clickables,  <br/>les boutons changent la valeur d’une propriété de l’item <br/>et cela déclenche un affichage en console."
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
            slideCode.code =" Rectangle {
        x: 0
        width: 500
        height: 500
        opacity: 0.4
        color: \"blue\"
        Rectangle {
            width: 250
            height: 250
            color: \"yellow\"
        }
    }

    Rectangle {
        x: 500
        width: 500
        height: 500
        visible: false
        color: \"green\"
        Rectangle {
            width: 250
            height: 250
            color: \"yellow\"
        }
    }"
            view.opacity = 0
        }
        else if(idState == 7)
        {
            slideCode.visible = true;
            slideCode.code ="property int marge: 20
property string text: \"\""
            view.opacity = 0
        }
        else if(idState == 9)
        {
            slideCode.visible = true;
            slideCode.code ="property alias text: titre.text
    Text{
        id: titre
        text: \"chocolat\"
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


   /* CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }*/
}
