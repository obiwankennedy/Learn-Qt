import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Model/View/Controler"

    onIdStateChanged: {
        console.log(idState)
        if(idState == 4)
        {
            slideCode.visible = true;
            slideCode.code ="
//HEADER
class GameModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit GameModel(QObject *parent = 0);
    int rowCount ( const QModelIndex & parent = QModelIndex() ) const;
    QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole ) const;
    bool setData(const QModelIndex & index, const QVariant & value, int role);
    virtual void removeItem(QModelIndex&);
    void append(Game* tmp);

private:
    QList<Game*> m_gameList;
};

// CPP
int GameModel::rowCount ( const QModelIndex &  ) const
{
    return m_gameList.count();
}

QVariant GameModel::data ( const QModelIndex & index, int role ) const
{
    if(!index.isValid())
        return QVariant();

    if((Qt::DisplayRole == role)||(Qt::EditRole == role))
    {
        return m_gameList[index.row()]->getTitle();
    }
    return QVariant();
}
void GameModel::append(Game* tmp)
{
    beginInsertRows(QModelIndex(),m_gameList.size(),m_gameList.size());
    m_gameList.append(tmp);
    endInsertRows();
}
void GameModel::removeItem(QModelIndex& index)
{
    beginRemoveRows(QModelIndex(),index.row(),index.row());
    Game* tmp = m_gameList.at(index.row());
    m_gameList.removeAll(tmp);
    endRemoveRows();
}
bool GameModel::setData(const QModelIndex & index, const QVariant & value, int role)
{
    if(!index.isValid())
        return false;

    Game* current=m_gameList.at(index.row());
    bool result = false;
    if(role==Qt::EditRole)
    {
        current->setTitle(value.toString());
        result=true;
    }
    return result;

}
"
            view.opacity = 0
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="
//HEADER
#ifndef LISTMODEL_H
#define LISSTMODEL_H
#include <QAbstractListModel>

class TableModel : public QAbstractTableModel {
    Q_OBJECT
public:
    TableModel(QObject *parent);
    int rowCount(const QModelIndex &parent = QModelIndex()) const ;
    int columnCount(const QModelIndex & parent) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    Qt::ItemFlags flags(const QModelIndex & index) const;
    bool setData(const QModelIndex & index, const QVariant & value, int role);
private:
    enum { ROW_NUM=3, COL_NUM=4 };
    int numbers[ROW_NUM][COL_NUM];
};

#endif
// CPP
#include \"TableModel.h\"

TableModel::TableModel(QObject *parent) :QAbstractTableModel(parent)
{
    for (int i=0;i<ROW_NUM;i++)
        for (int j=0; j<COL_NUM;j++)
            numbers[i][j] = i+j;
}
int TableModel::rowCount(const QModelIndex & /*parent*/) const
{
   return ROW_NUM;
}

int TableModel::columnCount(const QModelIndex & /*parent*/) const
{
   return COL_NUM;
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    if (role == Qt::DisplayRole)
       return QVariant( numbers[index.row()] [index.column()] );
    return QVariant();
}

Qt::ItemFlags TableModel::flags(const QModelIndex & index) const
{
    return Qt::ItemIsSelectable |   Qt::ItemIsEnabled  | Qt::ItemIsEditable;
}

bool TableModel::setData(const QModelIndex & index, const QVariant & value, int role)
{
    if (role != Qt::EditRole) return true;
    numbers[index.row()] [index.column()] = value.toInt();
    return true;
}
"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="
//HEADER
class SessionItemModel : public QAbstractItemModel
{
    Q_OBJECT
public:
    enum COLUMN_TYPE {Name,LoadingMode,Displayed,Path};
    SessionItemModel();
    virtual QModelIndex index( int row, int column, const QModelIndex & parent = QModelIndex() ) const;
    virtual QModelIndex parent( const QModelIndex & index ) const;
    virtual int rowCount(const QModelIndex&) const;
    virtual int columnCount( const QModelIndex&) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QVariant headerData ( int section, Qt::Orientation orientation, int role = Qt::DisplayRole ) const;
    void remove(QModelIndex& index);
    void addResource(ResourcesNode* uri,QModelIndex& index);
    virtual bool setData ( const QModelIndex & index, const QVariant & value, int role = Qt::EditRole );
    virtual Qt::ItemFlags flags ( const QModelIndex & index ) const;
    virtual void saveModel(QDataStream& out);
    virtual void loadModel(QDataStream& in);
    Qt::DropActions supportedDropActions() const;
    bool dropMimeData(const QMimeData *data, Qt::DropAction action, int row, int column, const QModelIndex &parent);
    QStringList mimeTypes() const;
    QMimeData *mimeData(const QModelIndexList &indexes) const;
    void cleverURIHasChanged(CleverURI* uri);
public slots:
    void updateNode(ResourcesNode*);
signals:
    void openFile(CleverURI*,bool);
protected:
    bool moveMediaItem(QList<CleverURI*> items, const QModelIndex &parentToBe, int row, QList<QModelIndex> &formerPosition);
private:
    ResourcesNode* m_rootItem;/// root item address
    QStringList m_header;
};
"
            view.opacity = 0
        }
        else if(idState == 9)
        {
            slideCode.visible = true;
            slideCode.code ="
#include \"sessionitemmodel.h\"
#include \"data/cleveruri.h\"

#include <QDebug>
#include <QIcon>
#include <QFileInfo>
#include <QUrl>

SessionItemModel::SessionItemModel()
{
    m_header << tr(\"Name\")<< tr(\"Mode\")<< tr(\"Opened\")<< tr(\"Path\");
    m_rootItem = new Chapter();
    m_rootItem->setParentNode(NULL);


    connect(m_rootItem,SIGNAL(openFile(CleverURI*,bool)),this,SIGNAL(openFile(CleverURI*,bool)));
}
QModelIndex SessionItemModel::index( int row, int column, const QModelIndex & parent ) const
{
    if(row<0)
        return QModelIndex();

    ResourcesNode* parentItem = NULL;

    if (!parent.isValid())
        parentItem = m_rootItem;
    else
        parentItem = static_cast<ResourcesNode*>(parent.internalPointer());

    ResourcesNode* childItem = parentItem->getChildAt(row);
    if (childItem)
        return createIndex(row, column, childItem);
    else
        return QModelIndex();
}
QVariant SessionItemModel::data(const QModelIndex &index, int role ) const
{
    if(!index.isValid())
        return QVariant();

    ResourcesNode* tmp = static_cast<ResourcesNode*>(index.internalPointer());
    if(tmp)
    {
        if((role == Qt::DisplayRole)||(Qt::EditRole==role))
        {
            /// @TODO add column management for preventing this cast.
            return tmp->getData((ResourcesNode::DataValue)index.column());
        }
        else if(role == Qt::DecorationRole)
        {
            if(index.column()==Name)
            {
                return QIcon(tmp->getIcon());
            }
        }
    }
    return QVariant();
}
QModelIndex SessionItemModel::parent( const QModelIndex & index ) const
{

    if (!index.isValid())
        return QModelIndex();

    ResourcesNode *childItem = static_cast<ResourcesNode*>(index.internalPointer());
    ResourcesNode *parentItem = childItem->getParentNode();

    if (parentItem == m_rootItem)
        return QModelIndex();

    return createIndex(parentItem->rowInParent(), 0, parentItem);
}
bool  SessionItemModel::setData ( const QModelIndex & index, const QVariant & value, int role )
{
    if(!index.isValid())
        return false;

    if(Qt::EditRole==role)
    {
        ResourcesNode* childItem = static_cast<ResourcesNode*>(index.internalPointer());
        childItem->setName( value.toString());
        return true;
    }
    return false;
}
Qt::ItemFlags SessionItemModel::flags ( const QModelIndex & index ) const
{
    if (!index.isValid())
        return Qt::ItemIsEnabled;

    ResourcesNode* childItem = static_cast<ResourcesNode*>(index.internalPointer());
    if(childItem->mayHaveChildren())
        return Qt::ItemIsEnabled | Qt::ItemIsEditable | Qt::ItemIsSelectable | Qt::ItemIsDropEnabled /*| Qt::ItemIsUserCheckable */;
    else
        return Qt::ItemIsEnabled | Qt::ItemIsSelectable| Qt::ItemIsDragEnabled /*| Qt::ItemIsUserCheckable */;

}
int SessionItemModel::rowCount(const QModelIndex& index) const
{
    if(index.isValid())
    {
        ResourcesNode* tmp = static_cast<ResourcesNode*>(index.internalPointer());
        return tmp->getChildrenCount();
    }
    else
    {
        return m_rootItem->getChildrenCount();
    }
}
int SessionItemModel::columnCount(const QModelIndex&) const
{
    return m_header.size();
}


QVariant SessionItemModel::headerData ( int section, Qt::Orientation orientation, int role  ) const
{
    if((role==Qt::DisplayRole)&&(orientation==Qt::Horizontal))
    {
        return m_header.at(section);
    }
    return QVariant();
}
void SessionItemModel::updateNode(ResourcesNode* node)
{
    QModelIndex nodeIndex;
    QModelIndex parent;
    QList<ResourcesNode*> path;
    if(m_rootItem->seekNode(path,node))
    {
        ResourcesNode* parentItem=NULL;
        for(auto i : path)
        {
            if(NULL!=parentItem)
            {
                    nodeIndex = index(parentItem->indexOf(i),0,parent);
                    parent=nodeIndex;
            }
            parentItem=i;
        }
    }
    emit dataChanged(nodeIndex,nodeIndex);
}
void SessionItemModel::remove(QModelIndex& index)
{
    if(!index.isValid())
        return;
    ResourcesNode* indexItem = static_cast<ResourcesNode*>(index.internalPointer());
    QModelIndex parent = index.parent();
    ResourcesNode* parentItem=NULL;

    if(!parent.isValid())
        parentItem=m_rootItem;
    else
        parentItem= static_cast<ResourcesNode*>(parent.internalPointer());


    beginRemoveRows(index.parent(),index.row(),index.row());
    parentItem->removeChild(indexItem);
    endRemoveRows();
}
void SessionItemModel::addResource(ResourcesNode* node,QModelIndex& parent)
{
    if(m_rootItem->contains(node))
        return;

    Chapter* parentItem=NULL;
    if(!parent.isValid())
    {
        parentItem=m_rootItem;
    }
    else
    {
        ResourcesNode* node = static_cast<ResourcesNode*>(parent.internalPointer());
        if(!node->mayHaveChildren())
        {
            node=node->getParentNode();//leaf's parent is not a leaf indeed
        }
        parentItem=dynamic_cast<Chapter*>(node);// NULL when it is not a chapter.
    }

    beginInsertRows(QModelIndex(),parentItem->getChildrenCount(),parentItem->getChildrenCount());
    parentItem->addResource(node);
    endInsertRows();
}




"
            view.opacity = 0
        }
        else if(idState == 10)
        {
            slideCode.visible = true;
            slideCode.code ="
#ifndef RESSOURCESNODE_H
#define RESSOURCESNODE_H

#include <QString>
#include <QVariant>
#include <QIcon>
class ResourcesNode
{
public:
    enum DataValue {NAME,MODE,DISPLAYED,URI};
    ResourcesNode();
    QString name() const;
    void setName(const QString &name);
    virtual QString getValue() const;
    virtual void setValue(QString);
    virtual bool hasChildren() const ;
    virtual bool mayHaveChildren()const ;
    virtual int getChildrenCount()const;
    virtual ResourcesNode* getChildAt(int) const;
    virtual bool contains(ResourcesNode*);
    virtual QIcon getIcon();
    ResourcesNode* getParentNode() const;
    void setParentNode(ResourcesNode *parent);
    virtual int indexOf(ResourcesNode*);
    int rowInParent();
    virtual bool removeChild(ResourcesNode*);
    virtual void insertChildAt(int row, ResourcesNode*);
    virtual QVariant getData(ResourcesNode::DataValue)=0;
    virtual bool seekNode(QList<ResourcesNode*>& path,ResourcesNode* node)=0;
protected:
    QString m_name;
    QString m_value;
    ResourcesNode* m_parent;
};

#endif // RESSOURCESNODE_H
"
            view.opacity = 0
        }
        else
        {
            text.textFormat = TextEdit.RichText
            view.opacity = 1
            text.visible = false;
            slideCode.visible = false
            slideCode.focus = false
            view.focus = true

        }

    }

    ListModel {
        id: listSection
                ListElement {
                    name: "MVC"
                    index:0
                }
                ListElement {
                    name: "C++"
                    index:1
                }
                ListElement {
                    name: "Never use QListWidget/QTableWidget/QTreeWidget"
                    index:2
                }
                ListElement {
                    name: "List of elements"
                    index:3
                }
                ListElement {
                    name: "Table of elements"
                    index:5
                }
                ListElement {
                    name: "Element Tree"
                    index:7
                }
                ListElement {
                    name: "QML"
                    index:11
                }
                ListElement {
                    name: "QML with C++"
                    index:12
                }
                ListElement {
                    name: "Exercice: 04 mvc"
                    index:13
                }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
 /*   TextEdit {
        id: text
        readOnly: true
        text:""
        visible: false
        anchors.fill: view
        color: "white"
        font.pixelSize: parent.height*0.03
        textFormat: TextEdit.RichText

    }
    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }*/
}
