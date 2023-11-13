import sys
import conversions

from pathlib import Path
from PySide6.QtCore import QObject, Slot 
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME="io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION=1

@QmlElement
class Bridge(QObject):

	@Slot(str)
	def print(self, x):
		print(x)
		return()

	@Slot(float, float, float, result=list)
	def rgb_to_hsl(self, r, g, b):
		h, s, l = conversions.rgb_to_hsl(r, g, b)
		return(h, s, l)

	@Slot(float, float, float, result=list)
	def hsl_to_rgb(self, h, s, l):
		r, g, b = conversions.hsl_to_rgb(h, s, l)
		return(r, g, b)

app=QGuiApplication(sys.argv)
engine=QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('main.qml')
sys.exit(app.exec())