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
            name: "Emettre un signal du QML vers le C++"
            index:2
        }
        ListElement {
            name: "Appeler une fonction QML"
            index:4
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
    DiceResultModel* model = new DiceResultModel();
    engine.rootContext()->setContextProperty(\"_diceModel\",model);
    engine.load(QUrl(QStringLiteral(\"qrc:/main.qml\")));
    QList<QObject*> roots = engine.rootObjects();
    return app.exec();
}
"
            view.opacity = 0
        }
        else if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="
//QML
ApplicationWindow {
    id: app
    signal rollDiceCmd(string cmd)
    […]
}

TextField {
    id: diceCommand
    onEditingFinished:{
        app.rollDiceCmd(diceCommand.text)
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
    QObject::connect(root,SIGNAL(rollDiceCmd(QString)),&ctr,SLOT(rollDice(QString)));

    ctr.setEngine(&engine);

    ctr.setVisible(true);


    return app.exec();
}
"
            view.opacity = 0
        }
        else if(idState == 5)
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
