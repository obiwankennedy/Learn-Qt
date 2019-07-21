import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Attributs d’un Objet QML"

    ListModel {
        id: listSection
        ListElement {
            name: "-7 types d'attibuts: id, propriété, signaux, gestionnaire de sigaux, methode, <br/>propriétés et gestionnaires attachés, enumeration"
            index:0
        }
        ListElement {
            name: ""
            index:0
        }
        ListElement {
            name: "-L’attribut id"
            index:1
        }
        ListElement {
            name: "-Les propriétés"
            index:3
        }
        ListElement {
            name: "&nbsp;&nbsp;&nbsp;&nbsp;-Les importantes"
            index:4
        }
        ListElement {
            name: "&nbsp;&nbsp;&nbsp;&nbsp;-Ajouter une propriété et l’initialiser"
            index:6
        }
        ListElement {
            name: "&nbsp;&nbsp;&nbsp;&nbsp;-propriétés Groupées"
            index:9
        }
        ListElement {
            name: "&nbsp;&nbsp;&nbsp;&nbsp;-Ajouter un alias"
            index:11
        }
        ListElement {
            name: "-Les signaux"
            index:13
        }
        ListElement {
            name: "-Gestionnaire de signaux"
            index:15
        }
        ListElement {
            name: "-Méthode"
            index:17
        }
        ListElement {
            name: "-Enumeration (Qt5.10)"
            index:19
        }
        ListElement {
            name: "-Exercice"
            index:21
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
            slideCode.code ="import QtQuick 2.0

Column {
    width: 200; height: 200

    TextInput { id: myTextInput; text: \"Hello World\" }

    Text { text: myTextInput.text }
}"
            view.opacity = 0
        }

        if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code =" Item {
        x: 0
        width: 500
        height: 500
        visible: true
        opacity: 0.4
        Rectangle {
            color: \"yellow\"
        }
        Image {
            source: \"http://www.rolisteam.org\"
        }
    }
"
            view.opacity = 0
        }
        else if(idState == 7)
        {
            slideCode.visible = true;
            slideCode.code ="[default|readonly] property <propertyType> <propertyName>
[…]
import QtQuick 2.0
Rectangle {
    id: rect
    property int value
    property int marge: 500
    readonly property real step: width/25
    property color nextColor: \"red\"
    readonly property string text: \"Hello world\"
    property url source: \"http://www.rolisteam.org\"
    property Rectangle someRectangle : Rectangle {color: \"yellow\"}
    property var someVar : [25,100,200]
    Component.onCompleted: {
        rect.color = \"red\"
    }
}
"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Rectangle {
    // Assignement de valeurs statiques à l’initialisation
    width: 400
    height: 200

    Rectangle {
        // Nouage (binding) des valeurs à l’initialisation
        width: parent.width / 2
        height: parent.height
    }
}

"
            view.opacity = 0
        }
        else if(idState == 10)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Item {
Text {
    //dot notation
    font.pixelSize: 12
    font.b: true
    anchors.left: parent.left
    anchors.top: parent.top
}
Text {
    //group notation
    font { pixelSize: 12; b: true }
    anchors {left: parent.left; top: parent.top}
}
}

"
            view.opacity = 0
        }
        else if(idState == 12)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Rectangle {
    property alias buttonText: textItem.text

    width: 100; height: 30; color: \"magenta\"

    Text { id: textItem }

}
";
            view.opacity = 0
        }
        else if(idState == 14)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Item {
    id: root
    signal deactivated()
    signal actionPerformed(real xPosition, real yPosition)
    MouseArea {
        anchors.fill: parent
        onPressed: root.actionPerformed(mouse.x, mouse.y)
        onReleased: root.deactivated()
    }
}
";
            view.opacity = 0
        }
        else if(idState == 16)
        {
            slideCode.visible = true;
            slideCode.code ="
import QtQuick 2.0

Rectangle {
    id: root
    color: \"red\"
    width: 200
    height: 200
    signal deactivated()
    property int marge: 500
    onDeactivated: console.log(\"Desactivé:\")
    onColorChanged: onsole.log(\"La couleur a changé:\")
    onMargeChanged: console.log(\"Ne peut pas changer:\")
    MouseArea {
        anchors.fill: parent
        onReleased: root.deactivated()
    }
}
";
            view.opacity = 0
        }
        else if(idState == 18)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
import QtQuick.Layout 1.3

Item {
    function convertMileToKm(Mile) {
        return Mile*1.60934
    }
    GridLayout {
    columns: 2
        Text {
            text: \"Distance en Mile!\"
        }
        TextInput {
            text: \"0\"
            onTextChanged: result.text = \"Distance en Km:\" + convertMileToKm(text)
        }
        Text {
            id: result
            text: \"Distance en Km:\"
        }
    }
}
";
            view.opacity = 0
        }
        else if(idState == 20)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Text {
    enum TextType {
        Normal,
        Heading
    }

    property int textType: TextType.Normal

    font.bold: textType == MyText.TextType.Heading
    font.pixelSize: textType == MyText.TextType.Heading ? 24 : 12
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
