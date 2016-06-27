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
                next: "Présentation de Rolisteam"
            }
            ListElement {
                name: "Présentation de Rolisteam"
                path: "02_presentation.qml"
                time: 1
                next: "définition Jdr"
            }
            ListElement {
                name: "Introduction au jdr"
                path: "03_jdr_et_rolisteam.qml"
                time: 1
                next: "Les contraintes"
            }
            ListElement {
                name: "Advantages du Jdr et Inconvénients"
                path: "04_jdr_avantages_pb.qml"
                time: 1
                next: "Avantages à distance"
            }

            ListElement {
                name: "Pourquoi faire de JDR ?"
                path: "05_avantage_jdr_virtuel.qml"
                time: 1
                next: "Fonctionnalités"
            }
            ListElement {
                name: "Fonctionnalités Rolisteam"
                path: "06_fonctionnalites_rolisteam.qml"
                time: 1
                next: "le commencement"
            }
            ListElement {
                name: "Début de rolisteam"
                path: "07_rolisteam_debut.qml"
                time: 1
                next: "rolistik à rolisteam"
            }
            ListElement {
                name: "Rolistik à Rolisteam"
                path: "08_Rolistik_a_Rolisteam.qml"
                time: 1
                next: "Frise"
            }
            ListElement {
                name: "La frise"
                path: "10_frise_chronologique.qml"
                time: 1
                next: "Usage"
            }
            ListElement {
                name: "Son usage"
                path: "11_son_usage.qml"
                time: 1
                next: "Fonctionnement"
            }
            ListElement {
                name: "Son fonctionnement"
                path: "12_son_fonctionnement.qml"
                time: 1
                next: "DiceParser"
            }
            ListElement {
                name: "Dice Parser"
                path: "13_dice_parser.qml"
                time: 1
                next: "Themes et audio"
            }
            ListElement {
                name: "Themes et audio 3 pistes"
                path: "14_themes_audio_3_pistes.qml"
                next: "Les nouveautées 1.8"
                time: 1
            }
            ListElement {
                name: "Les Nouveautés 1.8"
                path: "15_nouveaute_1_8.qml"
                time: 1
                next: "À venir"
            }
            ListElement {
                name: "Projets d'avenir"
                path: "16_projet_avenir.qml"
                time: 1
                next: "Réussites"
            }
            ListElement {
                name: "Réussites"
                path: "17_reussites.qml"
                time: 1
                next: "Leçons"
            }
            ListElement {
                name: "Les leçons"
                path: "18_les_lecons.qml"
                time: 1
                next: "Libre et Rolisteam"
            }
            ListElement {
                name: "Objectif Rolisteam Libre"
                path: "19_objectif_rolisteam_libre.qml"
                time: 1
                next: "FAQ"
            }
            ListElement {
                name: "FAQ "
                path: "20_FAQ.qml"
                time: 1
                next: ""
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
            property variant model: model
             source: "pages/"+path

        }

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
                name: "Les Concepts"
                index:1
            }
            ListElement {
                name: "Les Chroniques"
                index:6
            }
            ListElement {
                name: "Le logiciel"//système de build, code spécifique par OS.
                index:9
            }
            ListElement {
                name: "Le bilan"
                index:15
            }
            ListElement {
                name: "Faq"
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
        visible: false
    }
    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        text: panelModel.get(view.currentIndex).next+">"
    }
}
