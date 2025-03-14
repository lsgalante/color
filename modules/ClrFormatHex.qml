import QtQuick

ClrFormat {
    id: root
    format: "hex"

    val: rgbToHex(main.ch0 * 255, ch1 * 255, ch2 * 255).toString()

    function rgbToHex(r, g, b) {
        return "#" + ((1 << 24) | (r << 16) | (g << 8) | b).toString(16).slice(1).toUpperCase();
    }
}
