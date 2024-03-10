import colorsys
import re

def get_readouts(colorSpace_in, chVals_in, encodings):
	readouts = []

	chVals_rgb = [0.00, 0.00, 0.00]
	chVals_hsl = [0.00, 0.00, 0.00]

	if colorSpace_in == 'rgb' or colorSpace_in == 'hex':
		chVals_rgb = chVals_in
		chVals_hsl = rgb_to_hsl(chVals_in)

	elif colorSpace_in == 'hsl':
		chVals_rgb = hsl_to_rgb(chVals_in)
		chVals_hsl = chVals_in
	
	for encoding in encodings:

		name = encoding['name']
		colorSpace_out = encoding['colorSpace']
		limit_min = encoding['limit_min']
		limit_max = encoding['limit_max']

		chVals_out = []
		encodingVals = []

		if colorSpace_out == 'rgb':
			chVals_out = chVals_rgb

		elif colorSpace_out == 'hsl':
			chVals_out = chVals_hsl

		elif colorSpace_out == 'hex':
			chVals_out = chVals_rgb


		chVals_out = [round(chVals_out[0], 2), round(chVals_out[1], 2), round(chVals_out[2], 2)]
		encodingVals = fit_vals(chVals_out, limit_min, limit_max)

		if colorSpace_out != 'hex':
			displayVal = get_displayVal(encodingVals, limit_min)

		else:
			print(chVals_out)
			print(encodingVals)
			displayVal = rgb_to_hex(encodingVals)
			print(displayVal)
			print('-')


		readout = {
			'colorSpace'  : colorSpace_out,
			'encoding'    : name,
			'chVals'      : chVals_out,
			'encodingVals': encodingVals,
			'displayVal'  : displayVal
		}

		readouts.append(readout)

	return readouts


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
		hex_val = hex_val.lstrip('0x')
		if len(hex_val) == 1:
			hex_val = '0' + hex_val
		elif len(hex_val) == 0:
			hex_val = '00'
		hex_color += hex_val
		ct +=1

	hex_color = '#' + hex_color
	return hex_color


def hsl_to_rgb(hsl):

	rgb = colorsys.hls_to_rgb(hsl[0], hsl[2], hsl[1])
	return rgb


def hsl_to_hex(hsl):

	rgb = hsl_to_rgb(hsl)
	hex_color = rgb_to_hex(rgb)
	return(hex_color)


def fit_vals(vals, limit_min, limit_max):

	vals_out = []
	ct = 0
	for val in vals:
		fit_range = float(limit_max[ct]) - float(limit_min[ct])
		val_fit = (((val - 0) * fit_range) / 1) + float(limit_min[ct])
		vals_out.append(val_fit)
		ct += 1

	return vals_out

def get_displayVal(chVals, limit_min):

	displayVal = ''

	ct = 0
	for chVal in chVals:
		val = ''
		split = re.split(r'\.', limit_min[ct])
		place_ct = 0

		if len(split) > 1:
			place_ct = len(split[1])
			val = round(chVal, place_ct)
			val = str(val)
			split = re.split(r'\.', val)

			if len(split[1]) != place_ct:
				missing = place_ct - len(split[1])

				for place in range(missing):
					val += '0'
			ct += 1

		else:
			val = re.split(r'\.', str(chVal))[0]

		displayVal += val + ' '

	displayVal = displayVal.rstrip(' ')
	return displayVal


def sledPos_to_chVal(sledPos, chHeight):

	sledHeight = 6
	chVal = chHeight - sledHeight - sledPos
	chVal /= chHeight - sledHeight
	return chVal


def chVal_to_sledPos(chVals, chHeight):

	sledHeight = 6
	pos_list = []
	for val in chVals:
		sledPos = val * (chHeight - sledHeight)
		sledPos = chHeight - sledHeight - sledPos
		poss.append(sledPos)

	return pos_list