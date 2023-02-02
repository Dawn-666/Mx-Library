#ifndef VERSION_H
#define VERSION_H
#undef VERSION_H
#include "../../Mx-Browser/src/version.h"

#undef VER_PRODUCTVERSION_STR
#ifdef KIT_QT5
#define VER_PRODUCTVERSION_STR      VER_VERSION_STR " 32bit"
#else
#define VER_PRODUCTVERSION_STR      VER_VERSION_STR " 64bit"
#endif

#undef VER_INTERNALNAME_STR
#undef VER_ORIGINALFILENAME_STR
#if defined KIT_MINGW && defined KIT_QT6
#define VER_INTERNALNAME_STR        "明曦-查询器 " VER_PRODUCTVERSION_STR ".dll"
#define VER_ORIGINALFILENAME_STR    "Mx-Browser.dll"
#elif defined KIT_MINGW && defined KIT_QT5
#define VER_INTERNALNAME_STR        "明曦-查询器 " VER_PRODUCTVERSION_STR ".E.dll"
#define VER_ORIGINALFILENAME_STR    "Mx-Browser E.dll"
#else
//#define VER_FILEDESCRIPTION_STR     "明曦-查询器(Pro版)"
#define VER_INTERNALNAME_STR        "明曦-查询器 " VER_PRODUCTVERSION_STR ".Pro.dll"
#define VER_ORIGINALFILENAME_STR    "Mx-Browser Pro.dll"
//#define VER_PRODUCTNAME_STR         "Mx-Browser Pro"
#endif

#endif // VERSION_H
