QT += widgets

TEMPLATE = lib
DEFINES += BROWSER_LIBRARY

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    ../../Mx-Browser/src/browserconfig.cpp \
    ../../Mx-Browser/src/browserutils.cpp \
    ../../Mx-Browser/src/dialog/config.cpp \
    ../../Mx-Browser/src/dialog/query.cpp \
    ../../Mx-Browser/src/mxbrowser.cpp

HEADERS += \
    ../../Mx-Browser/src/browserconfig.h \
    ../../Mx-Browser/src/browserutils.h \
    ../../Mx-Browser/src/dialog/config.h \
    ../../Mx-Browser/src/dialog/query.h \
    ../../Mx-Browser/src/libbrowser.h \
    ../../Mx-Browser/src/mxbrowser.h \
    ../../Mx-Browser/src/version.h \
    version.h

INCLUDEPATH += $$PWD/../../Mx-Browser

win32 : LIBS += -lgdi32 -lshell32 -luser32

# Default rules for deployment.
unix: target.path = /usr/lib
!isEmpty(target.path): INSTALLS += target

FORMS += \
    ../../Mx-Browser/src/dialog/config.ui \
    ../../Mx-Browser/src/dialog/query.ui

RC_FILE += version.rc

CONFIG(debug, debug|release) {
#     TARGET = $$join(TARGET,,,d)
     DEFINES += DEBUG
}

greaterThan(QT_MAJOR_VERSION, 5) {

    DEFINES += KIT_QT6

    contains(CONFIG, msvc) {
        DEFINES += VER_PRO
    } else: DEFINES += VER_STANDARD

} else: DEFINES += KIT_QT5 VER_E
