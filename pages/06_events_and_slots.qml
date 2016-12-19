import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Events and Signals and Slots"
    onIdStateChanged: {
        console.log(idState)
        if(idState == 4)
        {
            slideCode.visible = true;
            view.opacity = 0

            slideCode.code =""
        }
        else
        {
           // text.textFormat = TextEdit.RichText
            view.opacity = 1
           // text.visible = false;
            slideCode.visible = false
            slideCode.focus = false
            view.focus = true

        }
    }
    Keys.forwardTo: [view, slideCode]
    ListModel {
        id: listSection
        ListElement {
            name: "Events"
            index:0
        }
        ListElement {
            name: "Signal/Slots"
            index:1
        }
        ListElement {
            name: "FAQ"
            index:2
        }
        ListElement {
            name: "C++14"
            index:3
        }
        ListElement {
            name: "Execice"
            index:5
        }
    }
    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
