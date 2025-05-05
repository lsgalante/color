#include <QGuiApplication>
#include <QQmlApplicationEngine>
// #include "SettingsTree.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;

  // TreeManager treemanager;
  // engine.rootContext()->setContextProperty("treeModel", SettingsTree.model());

  engine.load(QUrl(QStringLiteral("qrc:main.qml")));
  
  if (engine.rootObjects().isEmpty())
    return -1;
  
  return app.exec();
}
