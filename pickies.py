from pathlib import Path
import sys

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == '__main__':
	app = QGuiApplication(sys.argv)

	engine = QQmlApplicationEngine()
	qml_file = Path(__file__).parent / "qml_file.qml"

	engine.load(QUrl.fromLocalFile(qml_file))

	app.exec()
	# if not engine.rootObjects():
	# 	sys.exit(-1)

	# 	exit_code = app.exec()
	# 	del engine

	# 	sys.exit(exit_code)

