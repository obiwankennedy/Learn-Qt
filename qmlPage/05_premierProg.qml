import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Premier programme"

    onIdStateChanged: {
        if(idState == 2)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code ="
import QtQuick 2.0

Item {
    Text{
        text:\"Hello World!!\"
    }
}"
            view.opacity = 0
        }
        else
        {
            text.textFormat = TextEdit.RichText
            view.opacity = 1
            text.visible = false;
            panel.visible = false;
            slideCode.visible = false
            view.focus = false
        }
    }

    ListModel {
        id: listSection
        ListElement {
            name: "Hello world!"
            index:0
        }
        ListElement {
            name: "Explication"
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
