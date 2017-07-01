import QtQuick 2.5

import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
//import Qt.labs.presentation 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: app
    visibility: Window.FullScreen
    width: app.width
    height: app.height
    visible: true
    title: qsTr("PIV and Qt5: The love story!")
    property alias current: view.currentIndex
    property bool qml: true

    onCurrentChanged: {
        //topcornerimage.visible = false
        //bottomcornerimage.visible = false
        if(current==0)
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        else if(current % 3 == 0)
        {
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        }
        else if(current % 3 == 1)
        {
            bgimg.source = "qrc:/rsrc/chaton.jpg";
        }
        else if(current % 3 == 2)
        {
            bgimg.source = "qrc:/rsrc/lionne.jpg";
           // topcornerimage.visible = true
        }
    }

    signal currentItemChanged(int current)
    ListModel {
            id: panelModel
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "Coding Rules"
            }
            ListElement {
                name: "Coding Rules"
                path: "02_codingRules.qml"
                time: 1
                next: "Coding Rules"
            }
            ListElement {
                name: "Coding Rules"
                path: "03_codingRules_bis.qml"
                time: 1
                next: "QObject"
            }
            ListElement {
                name: "QObject"
                path: "04_qobject.qml"
                time: 1
                next: "Events and Signals Slots"
            }
            ListElement {
                name: "Events and Signals Slots"
                path: "05_events_and_slots.qml"
                time: 1
                next: "MVC"
            }
            ListElement {
                name: "MVC"
                path: "06_mvc.qml"
                time: 1
                next: "QThread"
            }
            ListElement {
                name: "QThread"
                path: "07_qthread.qml"
                time: 1
                next: "deployment"
            }
            ListElement {
                name: "Deployment"
                path: "08_deployment.qml"
                time: 1
                next: "Bad Examples"
            }
            ListElement {
                name: "Bad Examples"
                path: "09_badExample.qml"
                time: 1
                next: "Internationalisation"
            }
            ListElement {
                name: "Internationalisation"
                path: "10_internationalisation.qml"
                time: 1
                next: "Third Part"
            }
            ListElement {
                name: "Third Part"
                path: "11_third_part.qml"
                time: 1
                next: ""
            }

            ListElement {
                name: "Tcp Socket"
                path: "12_Tcp_Socket.qml"
                time: 1
                next: ""
            }
            ListElement {
                name: "Misc"// JSON, Settings, c++11/14, drag and drop
                path: "13_misc.qml"
                time: 1
                next: ""
            }
        }

    ListModel {
            id: qmllearning
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "historique"
            }
            ListElement {
                name: "historique"
                path: "02_historique.qml"
                time: 1
                next: "Pré-requis"
            }
            ListElement {
                name: "Pré-requis"
                path: "03_requirement.qml"
                time: 1
                next: "Exemples"
            }
            ListElement {
                name: "Exemples"
                path: "04_exemple.qml"
                time: 1
                next: "Premier Prog QML"
            }
            ListElement {
                name: "Premier Prog QML"
                path: "05_premierProg.qml"
                time: 1
                next: "QtCreator"
            }
            ListElement {
                name: "QtCreator"
                path: "06_qtcreator.qml"
                time: 1
                next: "Les éléments de base"
            }
            ListElement {
                name: "Les éléments de base"
                path: "07_elementBase.qml"
                time: 1
                next: "Positionnement"
            }
            ListElement {
                name: "Positionnement"
                path: "08_positionnement.qml"
                time: 1
                next: "Properties"
            }
            ListElement {
                name: "Properties"
                path: "09_property.qml"
                time: 1
                next: "Binding"
            }
            ListElement {
                name: "Binding"
                path: "10_binding.qml"
                time: 1
                next: "Méthode de travail"
            }
            ListElement {
                name: "Méthode de travail"
                path: "11_methode_de_travail.qml"
                time: 1
                next: "Animations"
            }

            ListElement {
                name: "Animations"
                path: "12_animation.qml"
                time: 1
                next: "Machine à états"
            }
            ListElement {
                name: "Machine à états"// JSON, Settings, c++11/14, drag and drop
                path: "13_machine_etat.qml"
                time: 1
                next: "POO"
            }
            ListElement {
                name: "POO: faire son composant"
                path: "14_poo_son_composant.qml"
                time: 1
                next: "Mauvais exemple"
            }
            ListElement {
                name: "Mauvais"
                path: "09_badExample.qml"
                time: 1
                next: "Interactivité"
            }
            ListElement {
                name: "Interactivité"
                path: "15_interactivite.qml"
                time: 1
                next: "Javascript"
            }
            ListElement {
                name: "Javascript"
                path: "16_javascript.qml"
                time: 1
                next: "Les éléments complexes"
            }
            ListElement {
                name: "Les éléments complexes"
                path: "17_element_complexe.qml"
                time: 1
                next: "Multimedia"
            }
            ListElement {
                name: "Multimedia"
                path: "18_multimedia.qml"
                time: 1
                next: "MVC les models"
            }
            ListElement {
                name: "MVC les models"
                path: "20_mvc_model.qml"
                time: 1
                next: "MVC Les vues"
            }
            ListElement {
                name: "MVC Les vues"
                path: "19_mvc_view.qml"
                time: 1
                next: "Le cpp et QML"
            }
            ListElement {
                name: "Le cpp et QML"
                path: "21_cpp_et_qml.qml"
                time: 1
                next: "Image Provider"
            }
            ListElement {
                name: "Image Provider"
                path: "22_Image_provider.qml"
                time: 1
                next: "Dessiner en QML"
            }
            ListElement {
                name: "Dessiner en QML"
                path: "23_Dessiner_qml.qml"
                time: 1
                next: "La 3D"
            }
            ListElement {
                name: "La 3D"
                path: "24_3d_qml.qml"
                time: 1
                next: "RCSE"
            }
            ListElement {
                name: "RCSE"
                path: "25_RCSE.qml"
                time: 1
                next: "Contact"
            }
            ListElement {
                name: "Contact"
                path: "20_FAQ.qml"
                time: 1
                next: "FIN"
            }
        }





    Image {
        id: bgimg
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/rsrc/graywood2.jpg"
        verticalAlignment: Image.AlignBottom
    }
    FastBlur {
        anchors.fill: bgimg
        source: bgimg
        radius: 32
        opacity: bgimg.opacity
    }
    onVisibleChanged: trigger.start()


    PathView {
        id: view
        anchors.fill: parent
        model: qml ? qmllearning : panelModel
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
            //property variant model: model qrc:/qmlPage/01_intro.qml
             source: qml ? "qmlPage/"+path : "pages/"+path
             width: app.width
             height: app.height
             //anchors.fill: app.contentItem

        }
        /*delegate: Rectangle {
            width: app.width
            height: app.height
            color: colortxt
        }*/



        Timer {
            id: trigger
            interval: 10
            repeat: false
            onTriggered: app.currentItemChanged(view.currentIndex)
        }

        onOffsetChanged: {
            if(Math.floor(offset)===offset)
            {
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
            PathLine {
                x: view.width/2+view.width*qmllearning.count;
                y: view.height/2
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
        color: "white"
    }
    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        text: qml ? qmllearning.get(view.currentIndex).next+">" : panelModel.get(view.currentIndex).next+">"

        color: "white"
    }
}
