import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Qthread"
    onIdStateChanged: {
        console.log(idState)
        if(idState == 1)
        {
            slideCode.visible = true;
            view.opacity = 0

            slideCode.code ="#include <QtCore>

class Thread : public QThread
{
private:
    void run()
    {
        qDebug()<<\"From worker thread: \"<<currentThreadId();
    }
};

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    qDebug()<<\"From main thread: \"<<QThread::currentThreadId();

    Thread t;
    QObject::connect(&t, SIGNAL(finished()), &a, SLOT(quit()));

    t.start();
    return a.exec();
}"
        }
        else if(idState == 2)
        {
            slideCode.visible = true;
            view.opacity = 0

            slideCode.code ="
#include <QtWidgets>

class Thread : public QThread
{
    Q_OBJECT

public:
    Thread():m_stop(false)
    {}

public slots:
    void stop()
    {
        qDebug()<<\"Thread::stop called from main thread: \"<<currentThreadId();
        QMutexLocker locker(&m_mutex);
        m_stop=true;
    }

private:
    QMutex m_mutex;
    bool m_stop;

    void run()
    {
        qDebug()<<\"From worker thread: \"<<currentThreadId();
        while (1) {
            {
            QMutexLocker locker(&m_mutex);
            if (m_stop) break;
            }
            msleep(10);
        }
    }
};

#include \"main.moc\"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    qDebug()<<\"From main thread: \"<<QThread::currentThreadId();
    QPushButton btn(\"Stop Thread\");
    Thread t;

    QObject::connect(&btn, SIGNAL(clicked()), &t, SLOT(stop()));
    QObject::connect(&t, SIGNAL(finished()), &a, SLOT(quit()));

    t.start();
    btn.show();
    return a.exec();
}
"
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            view.opacity = 0

            slideCode.code ="#include <QtCore>

class FileGenerator : public QObject
{
    Q_OBJECT
public slots:
    void generateFile()
    {
        qDebug()<<\"Here I generate some files\"<<QThread::currentThreadId();
        m_data->writeData(\"File.xml\");

    }

private:
    Data* m_data;
};

#include \"main.moc\"

MainWindow::MainWindow()
{

    //QThread* m_thread
    m_thread = new QThread();

    //FileGenerator* m_worker
    m_worker = new FileGenerator();

    connect(ui->m_generateBtn,SIGNAL(Clicked())),m_thread,SLOT(start());
    connect(m_thread,SIGNAL(start())),m_worker,SLOT(generateFile()));


    m_worker->moveToThread(&t);

}
"
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            view.opacity = 0

            slideCode.code ="#include <QtCore>

class FileGenerator : public QObject
{
    Q_OBJECT
public slots:
    void generateFile()
    {
        qDebug()<<\"Here I generate some files\"<<QThread::currentThreadId();
        qreal i = 0;
        for(auto dataFile : m_data)
        {
            m_data->writeData(\"File_%1.xml\").arg(dataFile.getName());
            emit progress(++i/m_data.fileCount()*100);
        }

    }
public signals:
    void progress(int percent);

private:
    Data* m_data;
};

#include \"main.moc\"

MainWindow::MainWindow()
{

    //QThread* m_thread
    m_thread = new QThread();

    //FileGenerator* m_worker
    m_worker = new FileGenerator();

    connect(m_worker, SIGNAL(progress(int)), this, SLOT(displayProgress(int)),Qt::QueuedConnection);
    connect(ui->m_generateBtn,SIGNAL(Clicked())),m_thread,SLOT(start());
    connect(m_thread,SIGNAL(start())),m_worker,SLOT(generateFile()));


    m_worker->moveToThread(&t);

}
"
        }
        else
        {
            view.opacity = 1
            slideCode.visible = false
            slideCode.focus = false
            view.focus = true

        }
    }
    ListModel {
        id: listSection
        ListElement {
            name: "OneShot"
            index:0
        }
        ListElement {
            name: "Endless loop"
            index:2
        }
        ListElement {
            name: "Worker"
            index:4
        }
        ListElement {
            name: "Work and notify"
            index:6
        }
        ListElement {
            name: "Exercice Qthread"
            index:8
        }
    }
    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
