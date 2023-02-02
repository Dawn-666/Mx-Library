QT += widgets network core5compat axcontainer

TEMPLATE = lib
DEFINES += MICRO_CLIENT_LIBRARY IMPORT_BROWSER WIN32_LEAN_AND_MEAN HOOK_API

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    ../../Mx-Activator/src/activatorutils.h \
    ../../Mx-Activator/src/dialog/editor.h \
    ../../Mx-Activator/src/mxfile.h \
    ../../Mx-Activator/src/mxpacket.h \
    ../../Mx-Activator/src/packetfile.h \
    ../../Mx-MicroClient/src/angelconfig.h \
    ../../Mx-MicroClient/src/capture.h \
    ../../Mx-MicroClient/src/gameconfig.h \
    ../../Mx-MicroClient/src/gamehook.h \
    ../../Mx-MicroClient/src/headerformat.h \
    ../../Mx-MicroClient/src/libmicroclient.h \
    ../../Mx-MicroClient/src/mediamute.h \
    ../../Mx-MicroClient/src/mxmicroclient.h \
    ../../Mx-MicroClient/src/mxutils.h \
    ../../Mx-MicroClient/src/packethandler.h \
    ../../Mx-MicroClient/src/rocokingdom.h \
    ../../Mx-MicroClient/src/version.h \
    ../../Mx-MicroClient/src/watcherclient.h \
    ../../Mx-MicroClient/src/widget/spiritframe.h \
    ../../Mx-MicroClient/src/widget/statuswgt.h \
    ../../Mx-MicroClient/src/widget/watcherwgt.h \
    ../../Mx-MicroClient/src/window/gamewin.h \
    ../../Mx-MicroClient/src/window/hoverwin.h \
    ../../Mx-MicroClient/src/winsockpacket.h \
    version.h

SOURCES += \
    ../../Mx-Activator/src/activatorutils.cpp \
    ../../Mx-Activator/src/dialog/editor.cpp \
    ../../Mx-Activator/src/mxfile.cpp \
    ../../Mx-Activator/src/mxpacket.cpp \
    ../../Mx-Activator/src/packetfile.cpp \
    ../../Mx-MicroClient/src/gameconfig.cpp \
    ../../Mx-MicroClient/src/mediamute.cpp \
    ../../Mx-MicroClient/src/angelconfig.cpp \
    ../../Mx-MicroClient/src/capture.cpp \
    ../../Mx-MicroClient/src/gamehook.cpp \
    ../../Mx-MicroClient/src/mxmicroclient.cpp \
    ../../Mx-MicroClient/src/mxutils.cpp \
    ../../Mx-MicroClient/src/packethandler.cpp \
    ../../Mx-MicroClient/src/rocokingdom.cpp \
    ../../Mx-MicroClient/src/watcherclient.cpp \
    ../../Mx-MicroClient/src/widget/spiritframe.cpp \
    ../../Mx-MicroClient/src/widget/statuswgt.cpp \
    ../../Mx-MicroClient/src/widget/watcherwgt.cpp \
    ../../Mx-MicroClient/src/window/gamewin.cpp \
    ../../Mx-MicroClient/src/window/hoverwin.cpp \
    ../../Mx-MicroClient/src/winsockpacket.cpp

FORMS += \
    ../../Mx-Activator/src/dialog/editor.ui \
    ../../Mx-MicroClient/src/widget/spiritframe.ui \
    ../../Mx-MicroClient/src/widget/statuswgt.ui \
    ../../Mx-MicroClient/src/widget/watcherwgt.ui \
    ../../Mx-MicroClient/src/window/gamewin.ui \
    ../../Mx-MicroClient/src/window/hoverwin.ui

INCLUDEPATH += \
    $$PWD/include \
    $$PWD/include/quazip \
    $$PWD/include/quazip/zlib \
    $$PWD/../../Mx-Activator \
    $$PWD/../../Mx-Browser \
    $$PWD/../../Mx-MicroClient

win32 : LIBS += -lws2_32 -lshell32#-lgdi32 -lshell32 -luser32

# Default rules for deployment.
unix: target.path = /usr/lib
!isEmpty(target.path): INSTALLS += target

RC_FILE += version.rc

CONFIG(debug, debug|release) {
     #TARGET = $$join(TARGET,,,d)
     LIBS += -lwininet
     DEFINES += DEBUG
}

contains(CONFIG, msvc) {
    DEFINES += KIT_MSVC
} else: DEFINES += KIT_MINGW

greaterThan(QT_MAJOR_VERSION, 5) {

    DEFINES += KIT_QT6

    contains(CONFIG, msvc) {

        HEADERS += \
            ../../Mx-MicroClient/src/dialog/description.h \
            ../../Mx-MicroClient/src/widget/toolbarwgt.h
        HEADERS -= \
            ../../Mx-MicroClient/src/capture.h \
            ../../Mx-MicroClient/src/headerformat.h \
            ../../Mx-MicroClient/src/winsockpacket.h

        SOURCES += \
            ../../Mx-MicroClient/src/dialog/description.cpp \
            ../../Mx-MicroClient/src/widget/toolbarwgt.cpp
        SOURCES -= \
            ../../Mx-MicroClient/src/capture.cpp \
            ../../Mx-MicroClient/src/winsockpacket.cpp

        FORMS += \
            ../../Mx-MicroClient/src/dialog/description.ui \
            ../../Mx-MicroClient/src/widget/toolbarwgt.ui

        LIBS += \
            -L$$PWD/lib/x64 -ldetours \
            -L$$PWD/../build/Mx-Browser-Library_Qt_6_4_2_MSVC2019_64bit/release -lMx-Browser

        CONFIG(debug, debug|release) {
            LIBS += -L$$PWD/lib/x64/msvc_64 -lquazipd
        } else: LIBS += -L$$PWD/lib/x64/msvc_64 -lquazip

    } else : DEFINES += KIT_MINGW

    LIBS += -L$$PWD/lib/x64 -lwpcap -lpacket

} else {

    DEFINES += KIT_QT5

    LIBS += -lpsapi -L$$PWD/lib/x86 -lwpcap -lpacket

}

RC_FILE += \
    version.rc

