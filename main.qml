import QtQuick 2.5

import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: app
    //visibility: Window.FullScreen;
    width: ScreenW
    height: ScreenH
    visible: true
    title: qsTr("Rolisteam: Libérez vos parties!")
    signal currentItemChanged(int current)
    ListModel {
            id: panelModel
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
            }
            ListElement {
                name: "Présentation de Rolisteam"
                path: "02_presentation.qml"
                time: 1
            }
            ListElement {
                name: "Introduction au jdr"
                path: "03_jdr_et_rolisteam.qml"
                time: 1
            }
            ListElement {
                name: "Advantages du Jdr et Inconvénients"
                path: "021_raisons.qml"
                time: 1
            }

            ListElement {
                name: "Pourquoi faire de JDR ?"
                path: "031_les_trucs_cool_du_jdr.qml"
                time: 1
            }
            ListElement {
                name: "Les différences avec le jeu en ligne"
                path: "032_jdrEnLigne.qml"
                time: 1
            }
            ListElement {
                name: "Le point technique"
                path: "04_Rolistik_a_Rolisteam.qml"
                time: 1
            }
            ListElement {
                name: "Chronologie"
                path: "041_frise_chronologique.qml"
                time: 1
            }
            ListElement {
                name: "Comment ça marche"
                path: "042_comment_ca_marche.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "043_Exemple_code_1.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "044_avancees_techniques.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "045_dice_parser.qml"
                time: 1
            }
            ListElement {
                name: "Vectoriel"
                path: "046_vectoriel.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "047_autres.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "048_reussites.qml"
                time: 1
            }
            ListElement {
                name: "Le réseau"
                path: "049_echec.qml"
                time: 1
            }
            ListElement {
                name: "Jdr "
                path: "05_rolisteam_jdr.qml"
                time: 1
            }
            ListElement {
                name: "Concurernt "
                path: "06_concurrence.qml"
                time: 1
            }
            ListElement {
                name: "Concurernt "
                path: "07_FAQ.qml"
                time: 1
            }
        }
    //Component.onCompleted: app.currentItemChanged(0)
    onVisibleChanged: trigger.start()
    Rectangle {
        id: rect
        anchors.fill: parent
        color: "#E3E3E3"
    }

    PathView {
        id: view
        anchors.fill: parent
        model: panelModel
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
             source: "pages/"+path
        }//delegate
        Timer {
            id: trigger
            interval: 10
            repeat: false
            onTriggered: app.currentItemChanged(view.currentIndex)
        }

        onOffsetChanged: {
            if(Math.floor(offset)===offset)
            {
                //app.currentItemChanged(offset)
                trigger.start()
            }
        }
        focus: true
        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed:{
            incrementCurrentIndex()
        }
        Keys.onEscapePressed: {
            if(app.visibility === Window.FullScreen)
            {
                app.visibility = Window.Windowed;
            }
            else
            {
                app.visibility = Window.FullScreen;
            }
        }

        path: Path {
            startX: view.width/2
            startY: view.height/2
            PathLine { x: view.width/2+view.width*panelModel.count; y: view.height/2 }
        }
    }

    ListView {
        id: listView1
        x: ScreenW*0.01
        y: ScreenH*0.3
        width: ScreenW/2
        height: ScreenH*0.2
        delegate: Item {
            width: ScreenW/2
            height: listView1.height/listView1.count
                Text {
                    color: view.currentIndex>=index ? "black" : "gray"
                    text: name
                    font.pointSize: ScreenH/48
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true

                }
        }
        visible: view.currentIndex>0 ? true : false

        model: ListModel {
            ListElement {
                name: "Concepts"
                index:1
            }
            ListElement {
                name: "Chroniques"
                index:4
            }
            ListElement {
                name: "Le logiciel"//système de build, code spécifique par OS.
                index:5
            }
            ListElement {
                name: "Le libre"
                index:6
            }
            ListElement {
                name: "FAQ"
                index:18
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottomMargin: 50
        text: (view.currentIndex+1)+"/"+view.count
        visible: view.currentIndex>0 ? true : false
    }

    Image {
        anchors.fill: parent
        source: "qrc:/rsrc/Masque-Video.png"
        opacity: 0.5
        fillMode: Image.Pad
    }

}
