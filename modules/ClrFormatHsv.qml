import QtQuick

ClrFormat {
    id: root

    val: rgbToHsv(main.ch0, ch1, ch2).toString() 
    format: "hsv"

    function rgbToHsv(r, g, b) {
        let max = Math.max(r, g, b), min = Math.min(r, g, b);
        let h, s, v = max;

        let d = max - min;
        s = max === 0 ? 0 : d / max;

        if(max === min) {
            h = 0; // achromatic
        }
        else {
            switch(max) {
                case r:
                    h = (g - b) / d + (g < b ? 6 : 0);
                    break;
                case g:
                    h = (b - r) / d + 2;
                    break;
                case b:
                    h = (r - g) / d + 4;
                    break;
            }
            h /= 6;
        }

        const val0 = Math.round(h * 360).toFixed(2).toString(); // Hue in degrees (0-360)
        const val1 = Math.round(s * 100).toFixed(2).toString(); // Saturation in percentage
        const val2 = Math.round(v * 100).toFixed(2).toString(); // Value in percentage
        return val0 + " " + val1 + " " + val2 + " "
    }

}
