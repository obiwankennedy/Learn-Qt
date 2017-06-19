import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "MVC : les models"

    ListModel {
        id: listSection
        ListElement {
            name: "ListModel"
            index:0
        }
        ListElement {
            name: "XmlModel"
            index:1
        }
        ListElement {
            name: "Model du C++<br/>https://github.com/obiwankennedy/rcm/blob/master/gamemodel.h<br/>https://github.com/obiwankennedy/rcm/blob/master/gamemodel.cpp"
            index:2
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
            slideCode.code ="ListModel {
        id: listSection
        ListElement {
            name: \"Foo\"
            firstname:\"Paul\"
            color:\"red\"
        }
        ListElement {
            name: \"Bar\"
            firstname:\"Henry\"
            color:\"blue\"
        }
        ListElement {
            name: \"Jones\"
            firstname:\"Jessica\"
            color:\"purple\"
        }
        ListElement {
            name: \"Conor\"
            firstname:\"Sarah\"
            color:\"#808000\"
        }
    }"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="XmlListModel{
        id: xmlModel
        source: \"haiku.xml\"
        query: \"/catalog/haiku\"
        XmlRole {
            id: xmlRole; name: \"text\"; query: \"text/string()\"; 	}
        onStatusChanged: {
            console.log(\"Count: \"+ xmlModel.count);
        }
    }
______________


<?xml version=\"1.0\"?>
<catalog>
<haiku>
<text>
Compétence Oubliée
poésie satirique
Personnages joueurs médusés
</text>
</haiku>
<haiku>
<text>
Dans la vieille mare,
une grenouille saute,
le bruit de l'eau.
</text>
</haiku>
</catalog>
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
