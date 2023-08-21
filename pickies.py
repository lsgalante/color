from pathlib import Path
import sys

from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class Bridge(QObject):

	@Slot(float, result = float)
	def test_def(self, x):
		return(0.80)

if __name__ == '__main__':
	app = QGuiApplication(sys.argv)

	engine = QQmlApplicationEngine()

	qml_file = Path(__file__).parent / "qml_file.qml"

	engine.load(QUrl.fromLocalFile(qml_file))

	app.exec()