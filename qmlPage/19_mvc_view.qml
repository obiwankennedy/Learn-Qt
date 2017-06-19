import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "MVC : les vues"
    ListModel {
        id: listperson
        ListElement {
            name: "Paul Foo"
            colorItem:"red"
        }
        ListElement {
            name: "Henry Bar"
            colorItem:"blue"
        }
        ListElement {
            name: "Jessica Jones"
            colorItem:"purple"
        }
        ListElement {
            name: "Sarah Conor"
            colorItem:"#808000"
        }
    }
    onIdStateChanged: {
        if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="ListView {
        id: listOfPerson
        model: listperson
        height: 80
        delegate: Rectangle {
            color: colorItem
            width: listOfPerson.width/4
            height: 20
            Text {
                text: name
            }
        }
    }"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="GridView {
        id: gridOfPerson
        model: listperson
        width: 300;
        height: 200
        cellWidth: 100;
        cellHeight: 100
        delegate: Rectangle {
            color: colorItem
            width: gridOfPerson.cellWidth;
            height: gridOfPerson.cellHeight
            Text {
                text: name
            }
        }
    }"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="PathView {
        id: pathOfPerson
        model: listperson
        interactive: true
        path: Path {
                      startX: 200; startY: 150
                      PathQuad { x: 200; y: 25; controlX: 440; controlY: 125 }
                      PathQuad { x: 200; y: 150; controlX: -40; controlY: 125 }
                  }
        delegate: Rectangle {
            color: colorItem
            width: 100
            height: 100
            Text {
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  pathOfPerson.currentIndex = index;
            }
        }
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
    ListModel {
        id: listSection
        ListElement {
            name: "Listview"
            index:0
        }
        ListElement {
            name: "Gridview"
            index:2
        }
        ListElement {
            name: "Pathview"
            index:4
        }
    }

    ListView {
        id: listOfPerson
        model: listperson
        anchors.top: view.top
        anchors.left: view.right
        anchors.right: parent.right
        height: 200
        delegate: Rectangle {
            color: colorItem
            width: 100
            height: 40
            Text {
                text: name
            }
        }
        visible: idState === 0 ? true : false
    }
    GridView {
        id: gridOfPerson
        model: listperson
        anchors.top: listOfPerson.bottom
        anchors.left: view.right
        width: 300;
        height: 200
        cellWidth: 100;
        cellHeight: 100
        delegate: Rectangle {
            color: colorItem
            width: gridOfPerson.cellWidth;
            height: gridOfPerson.cellHeight
            Text {
                text: name
            }
        }
        visible: idState == 2 ? true : false
    }
    PathView {
        id: pathOfPerson
        model: listperson
        anchors.top: gridOfPerson.bottom
        anchors.left: view.right
        anchors.right: parent.right
        interactive: true
        path: Path {
                      startX: 200; startY: 150
                      PathQuad { x: 200; y: 25; controlX: 440; controlY: 125 }
                      PathQuad { x: 200; y: 150; controlX: -40; controlY: 125 }
                  }
        focus: true
        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed: {
            incrementCurrentIndex()
        }

        delegate: Rectangle {
            color: colorItem
            width: 100
            height: 100
            Text {
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  pathOfPerson.currentIndex = index;
            }
        }
        visible: idState === 4 ? true : false
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
