import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Contact"


    ListModel {
            id: listSection
                ListElement {//color=\"blue\"
                    name: "<i>Site web</i>: <b>www.rolisteam.org</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Github</i>: <b>github.com/Rolisteam</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Twitter</i>: <b>@Rolisteam</b></font>"
                    index:0
                }
                ListElement {
                    name: "<i>Facebook</i>: <b>www.facebook.com/rolisteam</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Liberapay</i>: https://liberapay.com/Rolisteam/donate"
                    index:0
                }
                ListElement {
                    name: "<i>Youtube</i>: www.youtube.com/channel/UC4uoGZl1nQRXbVs8WjxjKvw"
                    index:0
                }
                ListElement {
                    name: "<i>Irc</i>: <b>#RolisteamOfficial</b> on freenode.net"
                    index:0
                }
                ListElement {
                    name: "<i>Courriel</i>: <b>renaud@rolisteam.org</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Site Perso</i>: http://renaudguezennec.eu"
                    index:0
                }
                ListElement {
                    name: "<i>GitHub Perso</i>: http://github.com/obiwankennedy"
                    index:0
                }
      }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }


}
