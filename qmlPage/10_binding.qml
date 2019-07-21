import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Binding"

    ListModel {
        id: listSection
        ListElement {
            name: "Associé une propriété à une autre"
            index:0
        }
        ListElement {
            name: "javascript"
            index:1
        }
        ListElement {
            name: "Exercise: Afficher un carré dont la taille est
                    <br/>modifiée par les boutons PLUS ou MOINS"
            index:3
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
            slideCode.code ="// Binding avec une autre valeur
property int size : parent.itemCount

// Binding arithmétique
height: parent.height / 2

// Binding par fonction javascript
height: Math.min(parent.width, parent.height)

// Binding sur un opérateur ternaire
property int size : paysage ? parent.width : parent.height

// Binding sur plusieurs opérateurs ternaires
text : temperature > 100 ? \"vapeur\" : temperature <= 0 ? \"glace\" : \"liquide\"

// Binding sur inline function
text : {
    if(temperature > 100)
        return \"vapeur\"
    else if(temperature < 0)
        return \"glace\"
    else
        return \"liquide\"
}

// Binding sur function
text : methodeQuiRetourneUnTexte()
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
