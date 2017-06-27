import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
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
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="
Component {
        id: scenarioDelegate
        Item {
            height: parent.height*0.8//listView.currentIndex == index ? 120 : 60
            width: parent.width*0.8
            opacity: PathView.itemOpacity
            property double rotationValue2: PathView.itemRotation
            scale: PathView.iconScale
            z: PathView.isCurrentItem ? 5 : 0
            transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 1; z: 0 } angle:  rotationValue2}
            Rectangle {
                id:rect
                state: CurrentPlayer == 0 ? \"\" : CurrentPlayer == MaximumPlayer ? \"ready\" : \"wip\"
                property int playerCount: CurrentPlayer
                anchors.fill: parent
                height: parent.height
                color: \"red\"
                radius: 5
                border.width: 1
                Text {
                    id:titleLabel
                    text:Title
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id:gametitleLabel
                    text:GameTitle
                    anchors.top: titleLabel.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id:levelid
                    text: \"(\"+Level+\")\"
                    anchors.top: gametitleLabel.top
                    anchors.left: gametitleLabel.right
                    width: 100
                    height:20
                }
                Text {
                    id:playerCountTxt
                    text: CurrentPlayer +'/'+ MaximumPlayer
                    anchors.top: parent.top
                    anchors.right: parent.right
                }
                Text {
                    id:durationId
                    text: qsTr(\"Duration: \") + Duration
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                }
                Text {
                    id:gmId
                    text: qsTr(\"GM:\") + GMName
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                }
                Image {
                    id: image
                    source: PixmapRole ? \"image://game/\"+PixmapRole : \"image://game/default\"
                    cache: false
                    visible:PixmapRole.length>0
                    fillMode: Image.PreserveAspectFit
                    anchors.top: parent.top
                    anchors.left: gmId.right
                    anchors.leftMargin: 5
                    anchors.bottom: parent.bottom
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listView.currentIndex = index;
                    }
                }
                states: [
                    State {
                        name: \"\"
                    },
                    State {
                        name: \"wip\"
                    },
                    State {
                        name: \"ready\"
                    }
                ]
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
		ListElement {
			name: "delegate"
			index: 6
		}
        ListElement {
			name: "highlight"
            index: 8
		}
        ListElement {
            name: "Exercice: Faire une liste view et une pathview avec le model Players.<br/> Gérer le hightlight"
            index: 9
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
