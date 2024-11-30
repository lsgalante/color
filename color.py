# color.py

import sys
import colorsys
import color_funcs
import json

from pathlib import Path
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
QML_IMPORT_NAME="io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION=1

range_arr = [
	{
		"name": "rgb_lo",
		"encoding": "rgb",
		"min": ["0.00", "0.00", "0.00"],
		"max": ["1.00", "1.00", "1.00"]
	},
	{
		"name": "rgb_hi",
		"encoding": "rgb",
		"min": ["0", "0", "0"],
		"max": ["255", "255", "255"]
	},
	{
		"name": "hsl_lo",
		"encoding": "hsl",
		"min": ["0.00", "0.00", "0.00"],
		"max": ["1.00", "1.00", "1.00"]
	},
	{
		"name": "hsl_hi",
		"encoding": "hsl",
		"min": ["0", "0", "0"],
		"max": ["360", "100", "100"]
	},
	{
		"name": "hex",
		"encoding": "hex",
		"min": ["0", "0", "0"],
		"max": ["255", "255", "255"]
	}
]

# p = Path("~/.config/color/state.json")
# state = {}
# with open(p, "r") as file:
# 	state = json.loads(file.read())
# print(state["k"])

state = {
    "encoding": "rgb",
    "range": [0-10],
    "val_arr": [0.00, 0.00, 0.00],
    "p_arr": [0.00, 0.00, 0.00],
    "val_label": "val_label"
}

@QmlElement
class Bridge (QObject):

    @Slot(result=dict)
    def get_state(self):
        return state

    @Slot()
    def set_state(self, new_state):
        global state
        state = new_state
        return

if __name__ == "__main__":
	app = QGuiApplication(sys.argv)
	app.setApplicationDisplayName("color")

	engine = QQmlApplicationEngine()
	engine.quit.connect(app.quit)
	engine.load("/home/lucas/src/color/Main.qml")

	sys.exit(app.exec())
