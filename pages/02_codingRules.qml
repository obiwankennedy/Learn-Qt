import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle2
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Coding Rules (1/2)"

   onIdStateChanged: {
       if(idState == 3)
       {
            text.text  ="<tr><th>Bad</th><th>&nbsp;&nbsp;&nbsp;&nbsp;</th><th>Good</th></tr>
                        <tr><td>Cfoobar* pfbVal = new Cfoobar()</td><td>&nbsp;&nbsp;&nbsp;</td><td>FooBar* fooBar = new FooBar()</td></tr>
                        <tr><td>short nIndex;</td><td></td><td>short index;</td></tr>
                        <tr><td>float* pfVal;</td><td></td><td>float* val;</td></tr>
                        <tr><td>char** aepszChaines;</td><td></td><td>char** chaines</td></tr>
"
           text.visible = true;
           view.opacity = 0
       }
       else if(idState == 9)
       {

           //panel.visible = false
           slideCode.visible = true;
           slideCode.code="
public:
    Constructor();
public slots:
    void slot();
signals:
public members:

protected:
    void method():
protected slots:
    void slot();
protected:// attributes
    QString m_name;

private:
    void method():
private slots:
    void slot();
private:// attributes
    QString m_id;
"
        view.opacity = 0
       }
       else
       {
           slideCode.visible = false;
           text.textFormat = TextEdit.RichText
           view.opacity = 1
           text.visible = false;
       }
   }

    ListModel {
        id: listSection
                ListElement {
                    name: "In english"
                    index:0
                }
                ListElement {
                    name: "Uppercase for every types (e.g: CanManager)"
                    index:1
                }
                ListElement {
                    name: "Variable: int documentCount=0; (No hungarian notation)"
                    index:2
                }
                ListElement {
                    name: "Templates"
                    index:4
                }
                ListElement {
                    name: "Member (m_), global (g_)"
                    index:5
                }
                ListElement {
                    name: "No tabs, use spaces."
                    index:6
                }
                ListElement {
                    name: "Spaces and operators  (*,&…)"
                    index:7
                }
                ListElement {
                    name: "Section order: "
                    index:8
                }
                ListElement {
                    name: "Composition better than inheritance"
                    index:10
                }
    }

    TextEdit {
        id: text
        readOnly: true
        text:""
        visible: false
        anchors.fill: view
        color: "white"
        font.pixelSize: parent.height*0.03
        textFormat: TextEdit.RichText

    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    Item {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

        property string codeFontFamily: "Helvetica";
        property string code;
        property real codeFontSize: parent.height*0.03;
        property color textColor: "white";



        Rectangle {
            id: background
            anchors.fill: parent
            radius: height / 10;
            gradient: Gradient {
                GradientStop { position: 0; color: Qt.rgba(0.8, 0.8, 0.8, 0.5); }
                GradientStop { position: 1; color: Qt.rgba(0.2, 0.2, 0.2, 0.5); }
            }
            border.color: "white";
            border.width: height / 250;
            antialiasing: true
        }

        onCodeChanged: {
            listModel.clear();
            var codeLines = slideCode.code.split("\n");
            for (var i=0; i<codeLines.length; ++i) {
                listModel.append({
                                    line: i,
                                    code: codeLines[i]
                                 });
            }
        }



        ListModel {
            id: listModel
        }


        onVisibleChanged: {
            listView.currentIndex = -1;
        }

        ListView {
            id: listView;

            anchors.fill: parent;
            anchors.margins: background.radius / 2
            clip: true

            model: listModel;
            focus: true;

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.focus = true;
                    listView.currentIndex = listView.indexAt(mouse.x, mouse.y + listView.contentY);
                }

            }

            delegate: Item {

                id: itemDelegate

                height: lineLabel.height
                width: parent.width

                Rectangle {
                    id: lineLabelBackground
                    width: lineLabel.height * 3;
                    height: lineLabel.height;
                    color: slideCode.textColor;
                    opacity: 0.1;
                }

                Text {
                    id: lineLabel
                    anchors.right: lineLabelBackground.right;
                    text: (line+1) + ":"
                    color: slideCode.textColor;
                    font.family: slideCode.codeFontFamily
                    font.pixelSize: slideCode.codeFontSize
                    font.bold: itemDelegate.ListView.isCurrentItem;
                    opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;

                }

                Rectangle {
                    id: lineContentBackground
                    anchors.fill: lineContent;
                    anchors.leftMargin: -height / 2;
                    color: slideCode.textColor
                    opacity: 0.2
                    visible: itemDelegate.ListView.isCurrentItem;
                }

                Text {
                    id: lineContent
                    anchors.left: lineLabelBackground.right
                    anchors.leftMargin: lineContent.height;
                    anchors.right: parent.right;
                    color: slideCode.textColor;
                    text: code;
                    font.family: slideCode.codeFontFamily
                    font.pixelSize: slideCode.codeFontSize
                    font.bold: itemDelegate.ListView.isCurrentItem;
                    opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;
                }
            }
        }



    }

}
