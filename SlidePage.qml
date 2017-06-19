import QtQuick 2.0
import QtQuick.Window 2.2

Item {
    id: root
    property alias logo: image1.source
    property alias points: listView1.model
    property int idState: 0
    property alias  title: text1.text
    property alias view: listView1
    property alias slideCode: slideCode

    MouseArea {
        anchors.fill: parent
        onClicked: root.focus = true
    }

    Text {
        id: text1
        anchors.top:image1.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom
        width: root.width*0.5
        height: root.height*0.01
        color: "white"
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: root.height > 0 ? root.height/20 : 1
        textFormat: Text.RichText

    }

    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: root.width*0.04
        fillMode: Image.PreserveAspectFit
        width: root.width*0.05
        height: root.height*0.1
    }
    Keys.onUpPressed: {
        console.log("up")
        --idState;
    }
    Keys.onDownPressed: {
        console.log("down")
        ++idState
    }
    Keys.onPressed: {
        if(event.key === Qt.Key_PageDown)
        {
            ++idState
        }
        else if(event.key === Qt.Key_PageUp)
        {
            --idState;
        }
    }

    onIdStateChanged: {
        trigger.start()
    }
    Timer {
         id: trigger
         interval: 1001
         repeat: false
         onTriggered: app.currentItemChanged(view.currentItem)
     }
    ListView {
        id: listView1
        x: root.width*0.1
        y: root.height*0.2
        width: root.width/2
        height: root.height*0.75
        delegate: Item {
            width: root.width/2
            height: listView1.height/listView1.count
                Text {
                    color: "white"
                    text: name
                    font.pointSize: root.height > 0 ? root.height/28 : 1
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: false
                    wrapMode: Text.WordWrap
                    elide: Text.ElideLeft
                    onLinkActivated: Qt.openUrlExternally(link)
                    linkColor: "white"
                    textFormat: Text.StyledText

                }
                opacity: (root.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }


    }
    TextEdit {
            id: text
            readOnly: true
            text:""
            visible: false
            anchors.fill: view
            color: "white"
            font.pixelSize: parent.height*0.03
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
