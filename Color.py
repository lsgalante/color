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

encodings = [
	{
		'name'      : 'rgb_lo',
		'colorSpace': 'rgb',
		'limit_min' : ['0.00', '0.00', '0.00'],
		'limit_max' : ['1.00', '1.00', '1.00']
	},
	{
		'name'      : 'rgb_hi',
		'colorSpace': 'rgb',
		'limit_min'	: ['0', '0', '0'],
		'limit_max'	: ['255', '255', '255']
	},
	{
		'name'      : 'hsl_lo',
		'colorSpace': 'hsl',
		'limit_min' : ['0.00', '0.00', '0.00'],
		'limit_max' : ['1.00', '1.00', '1.00']
	},
	{
		'name'      : 'hsl_hi',
		'colorSpace': 'hsl',
		'limit_min' : ['0', '0', '0'],
		'limit_max' : ['360', '100', '100']
	},
	{
		'name'      : 'hex',
		'colorSpace': 'hex',
		'limit_min' : ['0', '0', '0'],
		'limit_max' : ['255', '255', '255']
	}
]

# p = Path('/home/lucas-alma/.config/color/state.json')
# state = {}
# with open(p, 'r') as file:
# 	state = json.loads(file.read())
# print(state['k'])

colorSpace_main = 'rgb'
encoding_main = 'rgb_lo'
chVals_main  = [0, 0, 0]
sledPstns_main = [0.00, 0.00, 0.00]
readouts_main = []

@QmlElement
class Bridge (QObject):

	@Slot()
	def setReadoutsMain(self):
		
		global readouts_main
		global colorsSpace_main
		global chVals_main
		global encodings
		readouts_main = color_funcs.get_readouts(colorSpace_main, chVals_main, encodings)
		return

	@Slot(result=list)
	def readReadoutsMain(self):

		global readouts_main
		return readouts_main

	@Slot(str)
	def setEncodingMain(self, encoding_main_new):

		global encoding_main
		encoding_main = encoding_main_new
		return

	@Slot(result=str)
	def readEncodingMain(self):

		global encoding_main
		return encoding_main

	@Slot(str)
	def setColorSpaceMain(self, colorSpace_new):

		global colorSpace_main
		colorSpace_main = colorSpace_new
		return

	@Slot(result=str)
	def readColorSpaceMain(self):

		global colorSpace_main
		return colorSpace_main

	@Slot(list)
	def setChValsMain(self, chVals_new):
		
		global chVals_main
		chVals_main = chVals_new
		return

	@Slot(result=list)
	def readChValsMain(self):

		global chVals_main
		return chVals_main

	@Slot(list)
	def setSledPstnsMain(self, sledPstns_new):

		global sledPstns_main
		sledPstns_main = sledPstns_new
		return 

	@Slot(result = list)
	def readSledPstnsMain(self):

		global sledPstns_main
		return sledPstns_main

	@Slot(list, float, result=list)
	def sledPstnsToChVals(self, sledPstns, chHeight):
		
		sledHeight = 6
		chVals = []
		for sledPos in sledPstns:
			chVal = chHeight - sledHeight - sledPos
			chVal /= chHeight - sledHeight
			chVals.append(chVal)
		return chVals

	@Slot(list, int, result=list)
	def chValsToSledPstns(self, chVals, chHeight):
		
		sledHeight = 6
		sledPstns = []
		for chVal in chVals:
			sledPos = chVal * (chHeight - sledHeight)
			sledPos = chHeight - sledHeight - sledPos
			sledPstns.append(sledPos)
		return sledPstns

	@Slot()
	def writeState(self):
		
		print('Writing state')
		return


if __name__ == "__main__":
	app = QGuiApplication(sys.argv)
	app.setApplicationDisplayName("Color")

	engine = QQmlApplicationEngine()
	engine.quit.connect(app.quit)
	engine.load('main.qml')

	sys.exit(app.exec())