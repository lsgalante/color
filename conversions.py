import colorsys

def rgb_to_hsl(r, g, b):
	hls = colorsys.rgb_to_hls(r, g, b)
	return(hls[0], hls[2], hls[1])

def hsl_to_rgb(h, s, l):
	rgb = colorsys.hls_to_rgb(h, l, s)
	return (rgb[0], rgb[1], rgb[2])