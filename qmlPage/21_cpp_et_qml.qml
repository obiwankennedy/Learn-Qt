import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Cpp et QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Définir des éléments dans le monde QML"
            index:0
        }
        ListElement {
            name: "Etendre QML avec des objects C++ [Controller, models]"
            index:2
        }
        ListElement {
            name: "Etendre QML avec des objects C++ Graphique [Items]"
            index:4
        }
        ListElement {
            name: "Emettre un signal du QML vers le C++"
            index:7
        }
        ListElement {
            name: "Appeler une fonction QML"
            index:9
        }
        ListElement {
            name: "Exercice: Faire un controller de vue"
            index:11
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
            slideCode.code ="int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(\"ScreenW\",1920);
    engine.rootContext()->setContextProperty(\"ScreenH\",1080);
    DataModel model;
    engine.rootContext()->setContextProperty(\"_dataModel\",&model);
    engine.load(QUrl(QStringLiteral(\"qrc:/main.qml\")));
    QList<QObject*> roots = engine.rootObjects();
    return app.exec();
}
"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="
qmlRegisterType<RobotController>(\"SoftBankSdk\", 1, 0, \"RobotController\");
[...]
class RobotController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ip ...)
    Q_PROPERTY(int type ...)
    Q_PROPERTY(QAbstractModelIndex* ...)
public:
    ...
    Q_INVOKABLE void connectToIp();
[...]
import SoftBankSdk 1.0
...
RobotController {
    id: ctrl
    ip: \"10.0.161.16\"
}
...
Button {
    onClicked: ctrl.connectToIp()
}
"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="// CPP
#include <QtQuick/QQuickPaintedItem>
#include <QColor>

class PieChart : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QColor color READ color WRITE setColor)

public:
    PieChart(QQuickItem *parent = 0);

    QString name() const;
    void setName(const QString &name);

    QColor color() const;
    void setColor(const QColor &color);

    void paint(QPainter *painter);

private:
    QString m_name;
    QColor m_color;
};
// CPP
qmlRegisterType<PieChart>(\"Charts\", 1, 0, \"PieChart\");
[...]
// QML
import Charts 1.0

PieChart {
    width: 100; height: 100
    name: \"A simple pie chart\"
    color: \"red\"
}
"
            view.opacity = 0
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="// CPP
#include \"RectItem.h\"
#include \"RectSGNode.h\"

class GraphNode : public QSGNode
{
  public:
    RectSGNode *background;
};

RectItem::RectItem()
: m_radius(10),m_color(Qt::red)
{
    setFlag(ItemHasContents, true);
}

QSGNode *RectItem::updatePaintNode(QSGNode *oldNode,
                         UpdatePaintNodeData *)
{
    GraphNode *node = static_cast<GraphNode *>(oldNode);
    QRectF rect = boundingRect();
    if (rect.isEmpty()) {
        delete node;
        return 0;
    }
    if (!node) {
        node = new GraphNode();
        node->background = new RectSGNode();
        node->appendChildNode(node->background);
    }

    node->background->repaint(rect, m_radius, m_color);
    return node;
}

void RectItem::geometryChanged(const QRectF &newGeometry,
                     const QRectF &oldGeometry)
{
    update();
    QQuickItem::geometryChanged(newGeometry, oldGeometry);
}
[...]
// QML
import Items 1.0

RectItem {
    anchors.fill: parent
    color: root.col
}
"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="
//QML
ApplicationWindow {
    id: app
    signal notifyError(string cmd)
    […]
}

TextField {
    id: diceCommand
    onEditingFinished:{
        var code = textIsValid(text)
        if(code != 0 )
            app.notifyError(codeToText(code))
    }
    […]
}
________

//CPP
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QmlControler ctr;
    engine.load(QUrl(QStringLiteral(\"qrc:/main.qml\")));
    QList<QObject*> roots = engine.rootObjects();
    QObject* root = roots.at(0);
    QObject::connect(root,SIGNAL(notifyError(QString)),&ctr,SLOT(logErrorMsg(QString)));

    ctr.setEngine(&engine);

    ctr.setVisible(true);


    return app.exec();
}
"
            view.opacity = 0
        }
        else if(idState == 10)
        {
            slideCode.visible = true;
            slideCode.code ="
//MyItem.qml
import QtQuick 2.0

Item {
    function myQmlFunction(msg) {
        console.log(\"Got message:\", msg)
        return \"some return value\"
    }
}
________

//CPP
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlEngine engine;

    QQmlComponent component(&engine, \"MyItem.qml\");
    QObject *object = component.create();

    QVariant returnedValue;
    QVariant msg = \"Hello from C++\";
    QMetaObject::invokeMethod(object, \"myQmlFunction\",
        Q_RETURN_ARG(QVariant, returnedValue),
        Q_ARG(QVariant, msg));

    qDebug() << \"QML function returned:\" << returnedValue.toString();
    delete object;

    return app.exec();
}
"
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
