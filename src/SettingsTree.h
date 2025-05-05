#ifndef TREEMANAGER_H
#define TREEMANAGER_H

#include <QObject>
#include <QStandardItemModel>
#include <QVariant>

class TreeManager : public QObject
{
  Q_OBJECT

public:
  explicit TreeManager(QObject *parent = nullptr);

  QStandardItemModel* model() const;

  
private:
  QStandardItemModel *m_treeModel;
  void setupSettingsTree();

};

#endif // TREEMANAGER_H
