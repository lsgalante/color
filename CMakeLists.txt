cmake_minimum_required(VERSION 3.16)
set(CMAKE_OSX_SYSROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.4.sdk" CACHE STRING "Sysroot for macOS")
project(color LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Qml QuickControls2)

qt_add_executable(color
    src/main.cpp
)

qt_add_qml_module(color
    URI color
    VERSION 1.0
    QML_FILES
        qml/main.qml
)

target_link_libraries(color
    PRIVATE Qt6::Quick Qt6::Core Qt6::Gui Qt6::Qml Qt6::QuickControls2
)
