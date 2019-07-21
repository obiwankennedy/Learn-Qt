import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Premier programme"

    onIdStateChanged: {
        if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Text{
       id: text
       text:\qsTr(\"Hello World!!\")
    }
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
            name: "Hello world!"
            index:0
        }
        ListElement {
            name: qsTr("$ qmlscene helloworld.qml")
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    TextEdit {
        id: text
        readOnly: true
        text:""
        visible: false
        anchors.fill: view
        color: "white"
        font.pixelSize: parent.height*0.05
        textFormat: TextEdit.RichText

    }

    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
}
