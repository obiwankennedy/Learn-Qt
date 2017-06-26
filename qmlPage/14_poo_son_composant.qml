import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Créer son composant?"

    ListModel {
        id: listSection
        ListElement {
            name: "Réfléchir en boite noire"
            index:0
        }
        ListElement {
            name: "Définir les propriétés de son item"
            index:1
        }
        ListElement {
            name: "Séparer les fichiers"
            index:3
        }
        ListElement {
            name: "Utiliser"
            index:5
        }
        ListElement {
            name: "Gérer plusieurs composants perso"
            index:7
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
            slideCode.code ="Item {
id: root
property int idState: 0
property string description: 0
property alias  title: titlebox.text
[…]
"
            view.opacity = 0
        }
        else if(idState == 4)
        {
            slideCode.visible = true;
            slideCode.code ="
//Square.qml
Item {
    id: root
    property int side: 0
    property Color color: rect.color
    Rectangle {
        id: rect
        width: side
        height: side
    }
}
    "
            view.opacity = 0
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="
Square {
    id: square1
    side: 200
    color: \"blue\"
}
";
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="//qmldir
module Rcse

TextInputField 1.0 TextInputField.qml
SelectField 1.0 SelectField.qml
TextAreaField 1.0 TextAreaField.qml
TextFieldField 1.0 TextFieldField.qml
CheckBoxField 1.0 CheckBoxField.qml
DiceButton 1.0 DiceButton.qml
ImageField 1.0 ImageField.qml


---------------------

import \"path/to/directory/\"
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
