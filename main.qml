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
                name: "Presentation"
                path: "02_presentation.qml"
                time: 1
            }
            ListElement {
                name: "Test"
                path: "021_raisons.qml"
                time: 1
            }
            ListElement {
                name: "Jdr et Rolisteam"
                path: "03_jdr_et_rolisteam.qml"
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


   /* 1280 => 1
    50 => X

    x => 50/1280*/
 /*   Rectangle {
        color: "yellow"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50//ScreenH*0.0390625
    }
    Rectangle {
        color: "yellow"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        height: 200//ScreenH*0.15625
        width: 200//ScreenH*0.15625
    }*/
    Image {
        anchors.fill: parent
        source: "qrc:/rsrc/Masque-Video.png"
        opacity: 0.5
        fillMode: Image.Pad
    }

}
