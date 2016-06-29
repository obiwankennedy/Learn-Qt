/***************************************************************************
    *   Copyright (C) 2016 by Renaud Guezennec                                *
    *   http://www.rolisteam.org/contact                                      *
    *                                                                         *
    *   rolisteam is free software; you can redistribute it and/or modify     *
    *   it under the terms of the GNU General Public License as published by  *
    *   the Free Software Foundation; either version 2 of the License, or     *
    *   (at your option) any later version.                                   *
    *                                                                         *
    *   This program is distributed in the hope that it will be useful,       *
    *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
    *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
    *   GNU General Public License for more details.                          *
    *                                                                         *
    *   You should have received a copy of the GNU General Public License     *
    *   along with this program; if not, write to the                         *
    *   Free Software Foundation, Inc.,                                       *
    *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
    ***************************************************************************/
#include "qmlcontroler.h"
#include "ui_qmlcontroler.h"
#include <QDebug>
#include "cpphighlighter.h"
#include <QQuickTextDocument>

template <class T> T childObject(QQmlApplicationEngine& engine,
                                 const QString& objectName,
                                 const QString& propertyName)
{
    QList<QObject*> rootObjects = engine.rootObjects();
    foreach (QObject* object, rootObjects)
    {
        QList<QObject*> children = object->findChildren<QObject*>(objectName);
        for(auto child : children)
        {
            if (child != 0)
            {
                std::string s = propertyName.toStdString();
                QObject* object = child->property(s.c_str()).value<QObject*>();
                Q_ASSERT(object != 0);
                T prop = dynamic_cast<T>(object);
                Q_ASSERT(prop != 0);
                return prop;
            }
        }
    }
    return (T) 0;
}

QmlControler::QmlControler(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::QmlControler)
{
    ui->setupUi(this);
    m_label = new QLabel();
    m_label->setLineWidth(0);
    m_label->setFrameStyle(QFrame::NoFrame);
    ui->scrollArea->setWidget(m_label);
    ui->scrollArea->setAlignment(Qt::AlignCenter);
    ui->scrollArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    ui->scrollArea->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);


    //connect(m_label)
    m_commentData << "1";
    m_commentData << "2";
    m_commentData << "3";
    m_commentData << "4";
    m_commentData << "5";
    m_commentData << "6";
    m_commentData << "7";
    m_commentData << "8";
    m_commentData << "9";
    m_commentData << "10";
    m_commentData << "11";

    m_currentScreen = 0;

    ui->scrollArea->installEventFilter(this);
}

QmlControler::~QmlControler()
{
    delete ui;
}
bool QmlControler::eventFilter(QObject* label, QEvent* vt)
{
    if(label==ui->scrollArea)
    {
        if(vt->type() == QEvent::Resize)
        {
            resizeLabel();
        }
    }
    return false;
}

QQmlApplicationEngine *QmlControler::getEngine() const
{
    return m_engine;
}

void QmlControler::setEngine(QQmlApplicationEngine *engine)
{
    m_engine = engine;
    initConnection();
}
void QmlControler::initConnection()
{
    QObject* root = m_engine->rootObjects().first();
    m_window = qobject_cast<QQuickWindow*>(root);
    m_label->setScaledContents(true);
    m_label->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);

    connect(root,SIGNAL(currentItemChanged(int)),this,SLOT(currentPageHasChanged(int)));



}
void QmlControler::currentPageHasChanged(int i)
{
    m_currentScreen = i;
    QImage img = m_window->grabWindow();

    if(img.isNull())
        return;

    static int count = 0;


    //img.save(tr("screens/%1_screen.png").arg(++count,2,10,QChar('0')),"png");
    qDebug() << "screen shot save" << ++count;

    /*m_ratioImage = (double)img.size().width()/img.size().height();
    m_ratioImageBis = (double)img.size().height()/img.size().width();

    m_label->setPixmap(QPixmap::fromImage(img));

    if((i+1>=0)&&(i+1<m_commentData.size()))
    {
        ui->textEdit->setHtml(m_commentData.at(i+1));
    }
    resizeLabel();
    QQuickTextDocument* doc = childObject<QQuickTextDocument*>(*m_engine, "cppTextEditor", "textDocument");
    if(NULL!=doc)
    {
        new CppHighLighter(doc->textDocument());
    }*/
}
void QmlControler::resizeLabel()
{
    int w = ui->scrollArea->viewport()->rect().width();
    int h = ui->scrollArea->viewport()->rect().height();
    if(w>h*m_ratioImage)
    {
        m_label->resize(h*m_ratioImage,h);
    }
    else
    {
        m_label->resize(w,w*m_ratioImageBis);
    }
    double m_ratioImage;
}
void QmlControler::resizeEvent(QResizeEvent *event)
{
        resizeLabel();

    QMainWindow::resizeEvent(event);

}
void QmlControler::closeEvent(QCloseEvent* closeEvnt)
{
     m_window->close();
     QMainWindow::closeEvent(closeEvnt);
}
void QmlControler::showEvent(QShowEvent * nt)
{
    QMainWindow::showEvent(nt);
}
