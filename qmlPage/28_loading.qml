import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Composant Dynamique"
    onIdStateChanged: {
        if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="
import QtQuick 2.0

Item {
    width: 100; height: 100

    Component {
        id: redSquare

        Rectangle {
            color: "red"
            width: 10
            height: 10
        }
    }

    Loader { sourceComponent: redSquare }
    Loader { sourceComponent: redSquare; x: 20 }
}
"
            view.opacity = 0
        }
        else if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Item {
    width: 200; height: 200

    Loader { 
        id: pageLoader
        source: "Page1.qml"
     }
}"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Row {
    Repeater {
        model: 3
        Rectangle {
            width: 100; height: 40
            border.width: 1
            color: "yellow"
        }
    }
}";
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="
import QtQuick 2.0

Item {
    width: 100; height: 100

    Component {
        id: redSquare
        Rectangle {
            color: "red"
            width: 50
            height: 50
        }
    }
    Component {
        id: yellowSquare
        Rectangle {
            color: "yellow"
            width: 50
            height: 50
        }
    }

  Row {
    Repeater {
      model: 10
      Loader { sourceComponent: index % 2 ? redSquare : yellowSquare }
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
            name: "Loader"
            index:0
        }
        ListElement {
            name: "Component"
            index:2
        }
        ListElement {
            name: "Repeater"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
