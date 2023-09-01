from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from pathlib import Path
import sys


h = 0.5
s = 0.65
l = 0.75

args = sys.argv

# mode 0: regular mode
# mode 1: sublime plugin mode
mode = 0

if len(args) == 3 and args[1] == '-s':
	mode = 1

if mode == 1:
	vals = eval(args[2])

	h = vals[0] / 360
	s = vals[1] / 100
	l = vals[2] / 100

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class Bridge(QObject):

	@Slot(result=float)
	def init_h(self):
		return(h)

	@Slot(result=float)
	def init_s(self):
		return(s)

	@Slot(result=float)
	def init_l(self):
		return(l)

	@Slot(float)
	def set_h(self, a):
		print(a * 360)

	@Slot(float)
	def set_s(self, a):
		print(a * 100)

	@Slot(float)
	def set_l(self, a):
		print(a * 100)

	@Slot(float, float, float, result = float)
	def test(self, h, s, l):
		return('')


if __name__ == '__main__':
	app = QGuiApplication(sys.argv)
	engine = QQmlApplicationEngine()
	qml_file = Path(__file__).parent / "qml_file.qml"
	engine.load(QUrl.fromLocalFile(qml_file))

	root = engine.rootObjects()

	app.exec()