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
#include <QApplication>
#include <QQmlApplicationEngine>
#include "qmlcontroler.h"
#include <QQmlContext>
#include <QQuickTextDocument>

#include "cpphighlighter.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("rectangle1.width",1280);
    engine.rootContext()->setContextProperty("rectangle1.height",720);

   /* QTextDocument text(NULL);
    CppHighLighter cppHighLighter(&text);
    engine.rootContext()->setContextProperty("_hightedDoc",&text);*/
    //engine.rootContext()->setContextProperty("CppHighLightedDocument",720);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QmlControler ctr;
    ctr.setEngine(&engine);

    //ctr.setVisible(true);


    return app.exec();
}
