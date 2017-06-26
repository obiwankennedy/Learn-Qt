import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Dessiner en QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Le Canvas"
            index:0
        }
        ListElement {
            name: "Contexte"
            index:2
        }
        ListElement {
            name: "L’utilisation"
            index:4
        }
        ListElement {
            name: "Exemple"
            index:6
        }
        ListElement {
            name: "Exercice: Dessiner une progresse bar animée dont la couleur est un dégradé."
            index:6
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    onIdStateChanged: {
        if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="Canvas {
        id: frise
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -200
        height: app.height/4
}
"
            view.opacity = 0
            frise.opacity=0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="onPaint : {
            var ctx = getContext(\"2d\")

"
            view.opacity = 0
            frise.opacity=0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code =" var heightOfArrow = app.height/20
            var lineW = 4
            //ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            //ctx.lineWidth = lineW;
            ctx.beginPath()
            ctx.moveTo(0,heightOfArrow)
            ctx.lineTo(frise.width-200,heightOfArrow)
            ctx.lineTo(frise.width-200,0)
            ctx.lineTo(frise.width,frise.height/2)
            ctx.lineTo(frise.width-200,frise.height)
            ctx.lineTo(frise.width-200,frise.height-heightOfArrow)
            ctx.lineTo(0,frise.height-heightOfArrow)
            ctx.closePath()
"
            view.opacity = 0
            frise.opacity=0
        }
        else if(idState == 7)
        {
            slideCode.visible = true;
            slideCode.code =" Canvas {
        id: frise
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        z:-1

        height: app.height/4
        onPaint : {
            var ctx = getContext(\"2d\")
            var heightOfArrow = app.height/20
            var lineW = 4
            //ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            //ctx.lineWidth = lineW;
            ctx.beginPath()
            ctx.moveTo(0,heightOfArrow)
            ctx.lineTo(frise.width-200,heightOfArrow)
            ctx.lineTo(frise.width-200,0)
            ctx.lineTo(frise.width,frise.height/2)
            ctx.lineTo(frise.width-200,frise.height)
            ctx.lineTo(frise.width-200,frise.height-heightOfArrow)
            ctx.lineTo(0,frise.height-heightOfArrow)
            ctx.closePath()
            //ctx.stroke();


            var gradient = ctx.createLinearGradient(0, 0, frise.width, frise.height);
            var hslValue = 0;
            var hslStep = 1.0/8
            for(var i = 0; i<8;++i)
            {
                gradient.addColorStop(i*hslStep, Qt.hsla(0.6, hslValue, 0.3, 1.0));
                hslValue+=hslStep
            }
            ctx.fillStyle = gradient
            ctx.fill();

            ctx.fillStyle = \"white\"

            //var arcValue = ctx.arc(10,frise.height/2,0,2*Math.PI);


        }
    }
"
            view.opacity = 0
            frise.opacity=0
        }
        else
        {
            frise.opacity=1
            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }

    Canvas {
        id: frise
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        z:-1

        height: app.height/4
        onPaint : {
            var ctx = getContext("2d")
            var heightOfArrow = app.height/20
            var lineW = 4
            //ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            //ctx.lineWidth = lineW;
            ctx.beginPath()
            ctx.moveTo(0,heightOfArrow)
            ctx.lineTo(frise.width-200,heightOfArrow)
            ctx.lineTo(frise.width-200,0)
            ctx.lineTo(frise.width,frise.height/2)
            ctx.lineTo(frise.width-200,frise.height)
            ctx.lineTo(frise.width-200,frise.height-heightOfArrow)
            ctx.lineTo(0,frise.height-heightOfArrow)
            ctx.closePath()
            //ctx.stroke();


            var gradient = ctx.createLinearGradient(0, 0, frise.width, frise.height);
            var hslValue = 0;
            var hslStep = 1.0/8
            for(var i = 0; i<8;++i)
            {
                gradient.addColorStop(i*hslStep, Qt.hsla(0.6, hslValue, 0.3, 1.0));
                hslValue+=hslStep
            }
            ctx.fillStyle = gradient
            ctx.fill();

            ctx.fillStyle = "white"

            //var arcValue = ctx.arc(10,frise.height/2,0,2*Math.PI);


        }
    }
}
