from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from pathlib import Path
import sys


h = 0.5
s = 0.65
l = 0.75

args = sys.argv

try:
	data = eval(args[1])
	vals = data[1]
	
	h = vals[0] / 360
	s = vals[1] / 100
	l = vals[2] / 100

except:
	x = 1


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
		
	@Slot(float, float, float)
	def return_hsl(self, h, s, l):
		print([h * 360, s * 100, l * 100])

if __name__ == '__main__':
	app = QGuiApplication(sys.argv)
	engine = QQmlApplicationEngine()
	qml_file = Path(__file__).parent / "qml_file.qml"
	engine.load(QUrl.fromLocalFile(qml_file))

	root = engine.rootObjects()

	app.exec()