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
#ifndef QMLCONTROLER_H
#define QMLCONTROLER_H

#include <QMainWindow>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QLabel>

namespace Ui {
class QmlControler;
}

class QmlControler : public QMainWindow
{
    Q_OBJECT

public:
    explicit QmlControler(QWidget *parent = 0);
    ~QmlControler();

    QQmlApplicationEngine *getEngine() const;
    void setEngine(QQmlApplicationEngine *engine);

public slots:
    void currentPageHasChanged(int i);
protected:
    void initConnection();
    void resizeEvent(QResizeEvent *event);
    void resizeLabel();
    void closeEvent(QCloseEvent *);
    void showEvent(QShowEvent *);
    bool eventFilter(QObject *, QEvent *);
private:
    Ui::QmlControler *ui;
    QQmlApplicationEngine* m_engine;
    QQuickWindow* m_window;
    QStringList m_commentData;
    QLabel* m_label;
    qreal m_ratioImage;
    qreal m_ratioImageBis;
    int m_currentScreen;

};

#endif // QMLCONTROLER_H
