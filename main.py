import sys
import colorsys
import conversions as mycons
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

args = sys.argv

h = 0.5
s = 0.65
l = 0.75

datum = ''
color_type = ''

try:
	datum = eval(args[1])
	color_type = datum[0]
	vals = datum[1]
	if color_type == 'hsl':
		h = float(vals[0])
		s = float(vals[1])
		l = float(vals[2])
		h, s, l = mycons.fit_down_hsl(h, s, l)

	elif color_type == 'rgb_hex':
		r_hex = vals[0]
		g_hex = vals[1]
		b_hex = vals[2]
		h, s, l = mycons.rgb_hex_to_hsl(r_hex, g_hex, b_hex)

	elif color_type == 'notag_rgb_a':
		r = float(vals[0])
		g = float(vals[1])
		b = float(vals[2])
		h, s, l = mycons.rgb_to_hsl(r, g, b)

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

		if color_type == 'hsl':
			h, s, l = mycons.fit_up_hsl(h, s, l)
			print(['hsl', [h, s, l]])

		elif color_type == 'rgb_hex':
			r, g, b = mycons.hsl_to_rgb(h, s, l)
			hex_r, hex_g, hex_b = mycons.rgb_to_rgb_hex(r, g, b)
			print(['rgb_hex', [hex_r, hex_g, hex_b]])

		elif color_type == 'notag_rgb_a':
			r, g, b = mycons.hsl_to_rgb(h, s, l)
			r = round(r / 255, 2)
			g = round(g / 255, 2)
			b = round(b / 255, 2)
			print(['notag_rgb_a', [r, g, b]])

	# @Slot(float, float, float)
	# def close_hsl(self, h, s, l):

	# 	if color_type == 'hsl':
	# 		h, s, l = mycons.fit_up_hsl(h, s, l)
			# print(['hsl', [h, s, l]])

		# if color_type == 'rgb_hex':

			# print(['rgb_hex', [hex_r, hex_g, hex_b]])

if __name__ == '__main__':
	app = QGuiApplication(sys.argv)
	engine = QQmlApplicationEngine()
	qml_file = Path(__file__).parent / "qml_file.qml"
	engine.load(QUrl.fromLocalFile(qml_file))
	root = engine.rootObjects()
	app.exec()