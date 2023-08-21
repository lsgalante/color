from pathlib import Path
import sys

from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

args = sys.argv
start_vals = [0.5, 0.5, 0.5]

if len(args) > 1:
	start_vals = [args[1].lstrip('-'), args[2].lstrip('-'), args[3].lstrip('-')]

print(start_vals)

@QmlElement
class Bridge(QObject):

	@Slot(float, result = float)
	def start_h(self, x):
		val = start_vals[0]
		print(val)
		return(float(val))

	@Slot(float, result = float)
	def start_s(self, x):
		val = start_vals[1]
		return(float(val))

	@Slot(float, result = float)
	def start_l(self, x):
		val = start_vals[2]
		return(float(val))

if __name__ == '__main__':
	app = QGuiApplication(sys.argv)

	engine = QQmlApplicationEngine()

	qml_file = Path(__file__).parent / "qml_file.qml"

	engine.load(QUrl.fromLocalFile(qml_file))

	app.exec()