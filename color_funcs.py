import colorsys
import re

def get_readouts(colorspace_in, ch_val_arr_in, encoding_arr):
	readout_arr = []

	ch_val_arr_rgb = [0.00, 0.00, 0.00]
	ch_val_arr_hsl = [0.00, 0.00, 0.00]

	if colorspace_in == "rgb" or colorspace_in == "hex":
		ch_val_arr_rgb = ch_val_arr_in
		ch_val_arr_hsl = rgb_to_hsl(ch_val_arr_in)

	elif colorspace_in == "hsl":
		ch_val_arr_rgb = hsl_to_rgb(ch_val_arr_in)
		ch_val_arr_hsl = ch_val_arr_in

	for encoding in encoding_arr:
		name = encoding["name"]
		colorspace_out = encoding["colorspace"]
		limit_min = encoding["limit_min"]
		limit_max = encoding["limit_max"]

		ch_val_arr_out = []
		encoding_val_arr = []

		if colorspace_out == "rgb":
			ch_val_arr_out = ch_val_arr_rgb
		elif colorspace_out == "hsl":
			ch_val_arr_out = ch_val_arr_hsl
		elif colorspace_out == "hex":
			ch_val_arr_out = ch_val_arr_rgb

		ch_val_arr_out = [round(ch_val_arr_out[0], 2), round(ch_val_arr_out[1], 2), round(ch_val_arr_out[2], 2)]
		encoding_val_arr = fit_val_arr(ch_val_arr_out, limit_min, limit_max)

		if colorspace_out != "hex":
			display_val = get_display_val(encoding_val_arr, limit_min)

		else:
			print(ch_val_arr_out)
			print(encoding_val_arr)
			display_val = rgb_to_hex(encoding_val_arr)
			print(display_val)
			print("-")


		readout = {
			"colorspace"  : colorspace_out,
			"encoding"    : name,
			"ch_val_arr"      : ch_val_arr_out,
			"encoding_val_arr": encoding_val_arr,
			"display_val"  : display_val
		}

		readout_arr.append(readout)

	return readout_arr


def rgb_to_hsl(rgb):
	hls = colorsys.rgb_to_hls(rgb[0], rgb[1], rgb[2])
	hsl = [hls[0], hls[2], hls[1]]
	return hsl

def rgb_to_hex(rgb):
	hex_color = ''
	ct = 0
	for val in rgb:
		# hex_val = round(val * 255, 0)
		hex_val = str(hex(int(val)))
		hex_val = hex_val.lstrip("0x")
		if len(hex_val) == 1:
			hex_val = "0" + hex_val
		elif len(hex_val) == 0:
			hex_val = "00"
		hex_color += hex_val
		ct +=1
	hex_color = "#" + hex_color
	return hex_color

def hsl_to_rgb(hsl):
	rgb = colorsys.hls_to_rgb(hsl[0], hsl[2], hsl[1])
	return rgb

def hsl_to_hex(hsl):
	rgb = hsl_to_rgb(hsl)
	hex_color = rgb_to_hex(rgb)
	return(hex_color)

def fit_val_arr(val_arr, limit_min, limit_max):
	val_arr_out = []
	ct = 0
	for val in val_arr:
		fit_range = float(limit_max[ct]) - float(limit_min[ct])
		val_fit = (((val - 0) * fit_range) / 1) + float(limit_min[ct])
		val_arr_out.append(val_fit)
		ct += 1
	return val_arr_out

def get_display_val(ch_val_arr, limit_min):
	display_val = ""
	ct = 0
	for ch_val in ch_val_arr:
		val = ""
		split = re.split(r"\.", limit_min[ct])
		place_ct = 0

		if len(split) > 1:
			place_ct = len(split[1])
			val = round(ch_val, place_ct)
			val = str(val)
			split = re.split(r"\.", val)

			if len(split[1]) != place_ct:
				missing = place_ct - len(split[1])

				for place in range(missing):
					val += "0"
			ct += 1

		else:
			val = re.split(r"\.", str(ch_val))[0]

		display_val += val + " "

	display_val = display_val.rstrip(" ")
	return display_val

def sled_p_to_ch_val(sled_p, ch_h):
	sled_h = 6
	ch_val = ch_h - sled_h - sled_p
	ch_val /= ch_h - sled_h
	return ch_val

def ch_val_to_sled_p(ch_val_arr, ch_h):
	sled_h = 6
	p_arr = []
	for val in ch_val_arr:
		sled_p = val * (ch_h - sled_h)
		sled_p = ch_h - sled_h - sled_p
		p_arr.append(sled_p)

	return p_arr
