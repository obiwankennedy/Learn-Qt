import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Multimedia"

    ListModel {
        id: listSection
        ListElement {
            name : "import QtMultimedia 5.8"
            index: 0
        }

        ListElement {
            name: "Jouer un son"
            index:1
        }
        ListElement {
            name: "Jouer une vidéo"
            index:4
        }
        ListElement {
            name: "MediaPlayer"
            index:6
        }
        ListElement {
            name: "Exercice: Jouer une vidéo sur deux vues"
            index:8
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    onIdStateChanged: {
        if(idState == 2)
        {
            slideCode.visible = true;
            slideCode.code ="Text {
    text: \"Click Me!\";
    font.pointSize: 24;
    width: 150; height: 50;

    Audio {
        id: playMusic
        source: \"music.wav\"
    }
    MouseArea {
        id: playArea
        anchors.fill: parent
        onPressed:  { playMusic.play() }
    }
}"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="Item {
    width: 640
    height: 360

    SoundEffect {
        id: effect
        source: \"test.wav\"
    }
    MouseArea {
        id: playArea
        anchors.fill: parent
        onPressed:  { effect.play() }
    }
}"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code =" Video {
    id: video
    width : 800
    height : 600
    source: \"video.avi\"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            video.play()
        }
    }

    focus: true
    Keys.onSpacePressed: video.paused = !video.paused
    Keys.onLeftPressed: video.position -= 5000
    Keys.onRightPressed: video.position += 5000
}"
            view.opacity = 0
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code =" Item {
    MediaPlayer {
        id: mediaplayer
        source: \"groovy_video.mp4\"
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
    }

    MouseArea {
        id: playArea
        anchors.fill: parent
        onPressed: mediaplayer.play();
    }
}"
            view.opacity = 0
        }
        else
        {

            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
}
