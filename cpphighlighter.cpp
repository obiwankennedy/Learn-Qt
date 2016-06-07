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
#include "cpphighlighter.h"

CppHighLighter::CppHighLighter(QTextDocument *parent)
    : QSyntaxHighlighter(parent)
{
    HighlightingRule rule;

    keywordFormat.setForeground(Qt::darkMagenta);

    QStringList keywordPatterns;
    keywordPatterns << "\\bif\\b" << "\\belse\\b" << "\\breturn\\b"<< "\\bwhile\\b" << "\\bforeach\\b" << "\\bfor\\b" << "\\bvoid\\b"<< "\\bint\\b"<< "\\bfloat\\b"<< "\\bdouble\\b"
                    << "\\bqint8\\b"
                    << "\\bquint8\\b"
                    << "\\bqint16\\b"
                    << "\\bquint16\\b"
                    << "\\bqint32\\b"
                    << "\\bquint32\\b"
                    << "\\bqint64\\b"
                    << "\\bquint64\\b"
                    << "\\bqreal\\b"
                    << "\\bbool\\b"
                    << "\\bconst\\b";

    foreach (const QString &pattern, keywordPatterns)
    {
        rule.pattern = QRegExp(pattern);
        rule.format = keywordFormat;
        highlightingRules.append(rule);
    }


    propertyFormat.setForeground(Qt::darkMagenta);
    rule.pattern = QRegExp("Q[A-Z][A-z]+");
    rule.format = propertyFormat;
    highlightingRules.append(rule);

    lookupFormat.setForeground(Qt::blue);
    rule.pattern = QRegExp("\\b[0-9]+\\b");
    rule.format = lookupFormat;
    highlightingRules.append(rule);

    quotationFormat.setForeground(Qt::green);
    rule.pattern = QRegExp("\".*\"");
    rule.format = quotationFormat;
    highlightingRules.append(rule);
    rule.pattern = QRegExp("'.*'");
    rule.format = quotationFormat;
    highlightingRules.append(rule);

    itemFormat.setForeground(QColor(Qt::darkBlue));
    rule.pattern =  QRegExp("^#[A-z]+\\b");
    rule.format = itemFormat;
    highlightingRules.append(rule);

    cppObjectFormat.setForeground(Qt::darkMagenta);
    rule.pattern =  QRegExp("\\b[A-z]+::");
    rule.format = cppObjectFormat;
    highlightingRules.append(rule);

}

void CppHighLighter::highlightBlock(const QString &text)
{
    foreach(const HighlightingRule &rule, highlightingRules)
    {
        QRegExp expression(rule.pattern);
        int index = expression.indexIn(text);
        while (index >= 0) {
            int length = expression.matchedLength();
            setFormat(index, length, rule.format);
            index = expression.indexIn(text, index + length);
        }
    }
    setCurrentBlockState(0);
}
