import QtQuick

ClrFormat {
    id: root
    format: "rgb"

    val: {
        const val0 = main.ch0.toFixed(2).toString();
        const val1 = ch1.toFixed(2).toString();
        const val2 = ch2.toFixed(2).toString();
        const val3 = ch3.toFixed(2).toString();
        return val0 + " " + val1 + " " + val2 + " " + val3;
    }
}
