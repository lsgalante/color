import sys
import colorsys

from pathlib import Path
from PySide6.QtCore import QObject, Slot 
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

master_vals = [0.00, 0.00, 0.00]


@QmlElement
class Bridge (QObject):

	@Slot (list)
	def setMasterVals (self, vals):
		master_vals = vals
		return

	@Slot (result=list)
	def readMasterVals (self):
		return master_vals

	@Slot (list, list, result=list)
	def roundVals (self, vals, decimal_places):
		rounded_vals = []
		i = 0
		for val in vals:
			rounded_val = round(val, decimal_places[i])
			rounded_vals.append(rounded_val)
		return rounded_vals

	@Slot(list, list, list, list, result=list)
	def fitVals(self, vals, new_min, new_max, decimal_places):
		fit_vals = []
		old_min = 0
		old_max = 1

		i = 0
		for val in vals:
			old_range = old_max - old_min
			new_range = new_max[i] - new_min[i]

			fit_val = (((val - old_min) * new_range) / old_range) + new_min[i]
			fit_val = round(fit_val, decimal_places[i])
			fit_vals.append(fit_val)

			i += 1

		return fit_vals

	@Slot(float, float, result=float)
	def sledPosToVal(self, sled_pos, channel_height):
		sled_height = 6
		val = channel_height - sled_height - sled_pos
		val /= channel_height - sled_height
		return val

	@Slot(list, float, result=list)
	def valToSledPos(self, vals, channel_height):
		sled_height = 6

		poss = []
		for val in vals:
			sled_pos = val * (channel_height - sled_height)
			sled_pos = channel_height - sled_height - sled_pos
			poss.append(sled_pos)

		return poss

	@Slot(list, result=str)
	def concat(self, inlist):
		val = ""
		for x in inlist:
			val += str(x) + " "
		return val

	@Slot(list, result=list)
	def rgb_to_hsl(self, rgb):
		hls = colorsys.rgb_to_hls(rgb[0], rgb[1], rgb[2])
		h = hls[0]
		l = hls[2]
		s = hls[1]
		return [h, l, s]

	@Slot(list, result=list)
	def hsl_to_rgb(self, hsl):
		rgb = colorsys.hls_to_rgb(hsl[0], hsl[2], hsl[1])
		r = rgb[0]
		g = rgb[1]
		b = rgb[2]
		return [r, g, b]


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

engine.quit.connect(app.quit)
engine.load('main.qml')
sys.exit(app.exec())