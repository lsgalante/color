import colorsys

def hsl_to_rgb(h, s, l):
	rgb = colorsys.hls_to_rgb(h, l, s)
	r = rgb[0]
	g = rgb[1]
	b = rgb[2]
	r, g, b = fit_up_rgb(r, g, b)
	return (r, g, b)

def hsl_to_rgb_hex(h, s, l):
	r, g, b = hsl_to_rgb(h, s, l)
	hex_r, hex_g, hex_b = rgb_to_rgb_hex(r, g, b)
	return(hex_r, hex_g, hex_b)

def hsv_to_rgb(h, s, v):
     # h -> [0, 360]
     # s -> [0, 100]
     # l -> [0, 100]

     # H = h / 360.0
     # S = s / 100.0
     # V = v / 100.0

     # RR, GG, BB = colorsys.hsv_to_rgb(H, S, V)
     # return int(RR * 255), int(GG * 255), int(BB * 255)
     return('x')

def hwb_to_rgb(h, w, b):
	# h -> [0, 360)
	# w -> [0, 100]
	# b -> [0, 100]
	# H = h / 360.0
	# W = w / 100.0
	# B = b / 100.0

	# RR, GG, BB = colorsys.hls_to_rgb(H, 0.5, 1)
	# RR = RR * (1 - W - B) + W
	# GG = GG * (1 - W - B) + W
	# BB = BB * (1 - W - B) + W

	# r, g, b = int(RR * 255), int(GG * 255), int(BB * 255)
	# r = 0 if r < 0 else 255 if r > 255 else r
	# g = 0 if g < 0 else 255 if g > 255 else g
	# b = 0 if b < 0 else 255 if b > 255 else b
	# return r, g, b
	return('x')

def lab_to_rgb(L, a, b):
	# L -> [0, 100]
	# a -> [-160, 160]
	# b -> [-160, 160]

	# Y = (L + 16.0) / 116.0
	# X = a / 500.0 + Y
	# Z = Y - b / 200.0

	# Y3 = Y ** 3.0
	# Y = Y3 if Y3 > 0.008856 else (Y - 16.0 / 116.0) / 7.787

	# X3 = X ** 3.0
	# X = X3 if X3 > 0.008856 else (X - 16.0 / 116.0) / 7.787

	# Z3 = Z ** 3.0
	# Z = Z3 if Z3 > 0.008856 else (Z - 16.0 / 116.0) / 7.787

	# # Normalize white point for Observer=2°, Illuminant=D65
	# X *= 0.95047
	# Y *= 1.0
	# Z *= 1.08883

	# # XYZ to RGB
	# RR = X * 3.240479 + Y * -1.537150 + Z * - 0.498535
	# GG = X * -0.969256 + Y * 1.875992 + Z * 0.041556
	# BB = X * 0.055648 + Y * -0.204043 + Z * 1.057311

	# RR = 1.055 * RR ** (1 / 2.4) - 0.055 if RR > 0.0031308 else 12.92 * RR
	# GG = 1.055 * GG ** (1 / 2.4) - 0.055 if GG > 0.0031308 else 12.92 * GG
	# BB = 1.055 * BB ** (1 / 2.4) - 0.055 if BB > 0.0031308 else 12.92 * BB

	# r, g, b = int(RR * 255), int(GG * 255), int(BB * 255)
	# r = 0 if r < 0 else 255 if r > 255 else r
	# g = 0 if g < 0 else 255 if g > 255 else g
	# b = 0 if b < 0 else 255 if b > 255 else b
	# return r, g, b
	return('x')

def lch_to_lab(L, c, h):
	# L -> [0, 100]
	# c -> [0, 230]`	 
	# h -> [0, 360)
	# a = c * math.cos(math.radians(h))
	# b = c * math.sin(math.radians(h))
	# return L, a, b
	return(x)

def lch_to_rgb(L, c, h):
	# L, a, b = lchb_to_lab(L, c, h)
	# return lab_to_rgb(L, a, b)
	return('x')

def rgba_to_rgba_hex(r, g, b, a):
	if g is not None and b is not None:	
		sr = '%X' % rb

		if len(sr) == 1:
			sr = '0' + sr
		
		sg =  '%X' % g
		
		if len(sg) == 1:
			sg = '0' + sg
		
		sb = '%X' % b
	
		if len(sb) == 1:
			sb = '0' + sb
	
	else:
		sr = r[1:3]
		sg = r[3:5]
		sb = r[5:7]
		sa = '%X' % int(a / 100.0 * 255)
	
	if len(sa) == 1:
		sa = '0' + sa
	
	return '#%s%s%s%s' % (sr, sg, sb, sa)

def rgb_hex_to_hsl(r_hex, g_hex, b_hex):
	r, g, b = rgb_hex_to_rgb(r_hex, g_hex, b_hex)
	r, g, b = fit_down_rgb(r, g, b)
	h, s, l = rgb_to_hsl(r, g, b)
	return(h, s, l)

def rgb_hex_to_rgb(r_hex, g_hex, b_hex):
	r = int(r_hex, 16)
	g = int(g_hex, 16)
	b = int(b_hex, 16)
	return(r, g, b)

def rgb_to_hsl(r, g, b):
	hls = colorsys.rgb_to_hls(r, g, b)
	h, s, l = round(hls[0], 4), round(hls[2], 4), round(hls[1], 4)
	return(h, s, l)

def rgb_to_rgb_hex(r, g, b):
	r = int(round(r, 0))
	g = int(round(g, 0))
	b = int(round(b, 0))
	hex_r = hex(r)
	hex_r = hex_r[2] + hex_r[3]
	hex_g = hex(g)
	hex_g = hex_g[2] + hex_g[3]
	hex_b = hex(b)
	hex_b = hex_b[2] + hex_b[3]
	return(hex_r, hex_g, hex_b)

def fit_down_hsl(h, s, l):
	h = round(h / 360, 4)
	s = round(s / 100, 4)
	l = round(l / 100, 4)
	return(h, s, l)

def fit_up_hsl(h, s, l):
	h = round(h * 360, 2)
	s = round(s * 100, 2)
	l = round(l * 100, 2)
	return(h, s, l)

def fit_down_rgb(r, g, b):
	r = round(r / 255, 4)
	g = round(g / 255, 4)
	b = round(b / 255, 4)
	return(r, g, b)

def fit_up_rgb(r, g, b):
	r = round(r * 255, 2)
	g = round(g * 255, 2)
	b = round(b * 255, 2)
	return(r, g, b)