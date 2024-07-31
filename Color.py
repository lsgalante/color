import sys
import colorsys
import color_funcs
import json

from pathlib import Path
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

encoding_arr = [
	{
		"name": "rgb_lo",
		"colorspace": "rgb",
		"limit_min": ["0.00", "0.00", "0.00"],
		"limit_max": ["1.00", "1.00", "1.00"]
	},
	{
		"name": "rgb_hi",
		"colorspace": "rgb",
		"limit_min": ["0", "0", "0"],
		"limit_max": ["255", "255", "255"]
	},
	{
		"name": "hsl_lo",
		"colorspace": "hsl",
		"limit_min": ["0.00", "0.00", "0.00"],
		"limit_max": ["1.00", "1.00", "1.00"]
	},
	{
		"name": "hsl_hi",
		"colorspace": "hsl",
		"limit_min": ["0", "0", "0"],
		"limit_max": ["360", "100", "100"]
	},
	{
		"name": "hex",
		"colorspace": "hex",
		"limit_min": ["0", "0", "0"],
		"limit_max": ["255", "255", "255"]
	}
]

# p = Path("/home/lucas-alma/.config/color/state.json")
# state = {}
# with open(p, "r") as file:
# 	state = json.loads(file.read())
# print(state["k"])

main_colorspace = "rgb"
main_encoding = "rgb_lo"
main_ch_val_arr = [0, 0, 0]
main_sled_p_arr = [0.00, 0.00, 0.00]
main_readout_arr = []

@QmlElement
class Bridge (QObject):

	@Slot()
	def set_main_readout_arr(self):
		global main_readout_arr
		global main_colorspace
		global main_ch_val_arr
		global encoding_arr
		main_readout_arr = color_funcs.get_readouts(main_colorspace, main_ch_val_arr, encoding_arr)
		return

	@Slot(result=list) #pyright: ignore
	def get_main_readout_arr(self):
		global main_readout_arr
		return main_readout_arr

	@Slot(str)
	def set_main_encoding(self, new_main_encoding):
		global main_encoding
		main_encoding = new_main_encoding
		return

	@Slot(result=str) #pyright: ignore
	def get_main_encoding(self):
		global main_encoding
		return main_encoding

	@Slot(str)
	def set_main_colorspace(self, new_colorspace):
		global main_colorspace
		main_colorspace = new_colorspace
		return

	@Slot(result=str) #pyright: ignore
	def get_main_colorspace(self):
		global main_colorspace
		return main_colorspace

	@Slot(list)
	def set_main_ch_val_arr(self, new_ch_val_arr):
		global main_ch_val_arr
		main_ch_val_arr = new_ch_val_arr
		return

	@Slot(result=list) #pyright: ignore
	def get_main_ch_val_arr(self):
		global main_ch_val_arr
		return main_ch_val_arr

	@Slot(list)
	def set_main_sled_p_arr(self, new_sled_p_arr):
		global main_sled_p_arr
		main_sled_p_arr = new_sled_p_arr
		return

	@Slot(result = list) #pyright: ignore
	def get_main_sled_p_arr(self):
		global main_sled_p_arr
		return main_sled_p_arr

	@Slot(list, float, result=list) #pyright: ignore
	def sled_p_arr_to_ch_val_arr(self, sled_p_arr, ch_h):
		sled_h = 6
		ch_val_arr = []
		for sled_p in sled_p_arr:
			ch_val = ch_h - sled_h - sled_p
			ch_val /= ch_h - sled_h
			ch_val_arr.append(ch_val)
		return ch_val_arr

	@Slot(list, int, result=list) #pyright: ignore
	def ch_val_arr_to_sled_p_arr(self, ch_val_arr, ch_h):
		sled_h = 6
		sled_p_arr = []
		for ch_val in ch_val_arr:
			sled_p = ch_val * (ch_h - sled_h)
			sled_p = ch_h - sled_h - sled_p
			sled_p_arr.append(sled_p)
		return sled_p_arr

	@Slot()
	def write_state(self):
		print("Writing state")
		return

if __name__ == "__main__":
	app = QGuiApplication(sys.argv)
	app.setApplicationDisplayName("Color")

	engine = QQmlApplicationEngine()
	engine.quit.connect(app.quit)
	engine.load("main.qml")

	sys.exit(app.exec())
