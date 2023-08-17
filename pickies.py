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

# @QmlElement(QObject):
# class bridge(qobject):

	# def hsv_to_rgb(h, s, v):
	#      # h -> [0, 360]
	#      # s -> [0, 100]
	#      # l -> [0, 100]

	#      H = h / 360.0
	#      S = s / 100.0
	#      V = v / 100.0

	#      RR, GG, BB = colorsys.hsv_to_rgb(H, S, V)
	#      return int(RR * 255), int(GG * 255), int(BB * 255)

	# def hsl_to_rgb(h, s, l):
	# 	# h -> [0, 360)
	# 	# s -> [0, 100]
	# 	# l -> [0, 100]

	# 	H = h / 360.0
	# 	S = s / 100.0
	# 	L = l / 100.0

	# 	RR, GG, BB = colorsys.hls_to_rgb(H, L, S)
	# 	return int(RR * 255), int(GG * 255), int(BB * 255)

	# def hwb_to_rgb(h, w, b):
	# 	# h -> [0, 360)
	# 	# w -> [0, 100]
	# 	# b -> [0, 100]
	# 	H = h / 360.0
	# 	W = w / 100.0
	# 	B = b / 100.0

	# 	RR, GG, BB = colorsys.hls_to_rgb(H, 0.5, 1)
	# 	RR = RR * (1 - W - B) + W
	# 	GG = GG * (1 - W - B) + W
	# 	BB = BB * (1 - W - B) + W

	# 	r, g, b = int(RR * 255), int(GG * 255), int(BB * 255)
	# 	r = 0 if r < 0 else 255 if r > 255 else r
	# 	g = 0 if g < 0 else 255 if g > 255 else g
	# 	b = 0 if b < 0 else 255 if b > 255 else b
	# 	return r, g, b

	# def lab_to_rgb(L, a, b):
	# 	# L -> [0, 100]
	# 	# a -> [-160, 160]
	# 	# b -> [-160, 160]

	# 	Y = (L + 16.0) / 116.0
	# 	X = a / 500.0 + Y
	# 	Z = Y - b / 200.0

	# 	Y3 = Y ** 3.0
	# 	Y = Y3 if Y3 > 0.008856 else (Y - 16.0 / 116.0) / 7.787

	# 	X3 = X ** 3.0
	# 	X = X3 if X3 > 0.008856 else (X - 16.0 / 116.0) / 7.787

	# 	Z3 = Z ** 3.0
	# 	Z = Z3 if Z3 > 0.008856 else (Z - 16.0 / 116.0) / 7.787

	# 	# Normalize white point for Observer=2°, Illuminant=D65
	# 	X *= 0.95047
	# 	Y *= 1.0
	# 	Z *= 1.08883

	# 	# XYZ to RGB
	# 	RR = X * 3.240479 + Y * -1.537150 + Z * - 0.498535
	# 	GG = X * -0.969256 + Y * 1.875992 + Z * 0.041556
	# 	BB = X * 0.055648 + Y * -0.204043 + Z * 1.057311

	# 	RR = 1.055 * RR ** (1 / 2.4) - 0.055 if RR > 0.0031308 else 12.92 * RR
	# 	GG = 1.055 * GG ** (1 / 2.4) - 0.055 if GG > 0.0031308 else 12.92 * GG
	# 	BB = 1.055 * BB ** (1 / 2.4) - 0.055 if BB > 0.0031308 else 12.92 * BB

	# 	r, g, b = int(RR * 255), int(GG * 255), int(BB * 255)
	# 	r = 0 if r < 0 else 255 if r > 255 else r
	# 	g = 0 if g < 0 else 255 if g > 255 else g
	# 	b = 0 if b < 0 else 255 if b > 255 else b
	# 	return r, g, b


	# def lch_to_lab(L, c, h):
	# 	# L -> [0, 100]
		# c -> [0, 230]`	 
	# 	# h -> [0, 360)
	# 	a = c * math.cos(math.radians(h))
	# 	b = c * math.sin(math.radians(h))
	# 	return L, a, b


	# def lch_to_rgb(L, c, h):
	# 	L, a, b = lchb_to_lab(L, c, h)
	# 	return lab_to_rgb(L, a, b)


	# def tohex(r, g, b, a):
	# 	if g is not None and b is not None:	
	# 		sr = '%X' % rb
	
	# 		if len(sr) == 1:
	# 			sr = '0' + sr
			
	# 		sg =  '%X' % g
			
	# 		if len(sg) == 1:
	# 			sg = '0' + sg
			
	# 		sb = '%X' % b
		
	# 		if len(sb) == 1:
	# 			sb = '0' + sb
		
	# 	else:
	# 		sr = r[1:3]
	# 		sg = r[3:5]
	# 		sb = r[5:7]
	# 		sa = '%X' % int(a / 100.0 * 255)
		
	# 	if len(sa) == 1:
	# 		sa = '0' + sa
		
	# 	return '#%s%s%s%s' % (sr, sg, sb, sa)