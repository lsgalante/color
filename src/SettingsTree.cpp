#include "treemanager.h"
#include <QDebug>

TreeManager::TreeManager(QObject *parent)
  : QObject(parent)
  , m_treeModel(new QStandardItemModel(this))
{
  // set custom roles
  QHash<int, QByteArray> roleNames = m_treeModel->roleNames();
  roleNames.insert(Qt::UserRole + 1, "settingType"); // inr, bool, string etc.
  roleNames.insert(Qt::UserRole + 2, "settingValue"); // current value
  roleNames.insert(Qt::UserRole + 3, "settingPath"); // full path to setting
  m_treeModel->setItemRoleNames(roleNames);

  setupSettingsTree();
}

QStandardItemModel* TreeManager::model() const
{
  return m_treeModel;
}

void TreeManager::setupSettingsTree()
{

  QStandardItem *rootItem = m_treeModel->invisibleRootItem();

  // General settings
  QStandardItem *general = new QStandardItem("General");
  general->setData("category", Qt::UserRole + 1);
  general->setData("", Qt::UserRole + 2);
  general->setData("/General", Qt::UserRole + 3);
  rootItem->appendRow(general);

  // General settings children
  QStandardItem *theme = new QStandardItem("Theme");
  theme->setData("string", Qt::UserRole + 1);
  theme->setData("Light", Qt::UserRole + 2);
  theme->setData("/General/Theme", Qt::UserRole + 3);
  general->appendRow(theme);
}
