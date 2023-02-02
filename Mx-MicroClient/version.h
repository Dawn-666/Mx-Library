#ifndef VERSION_H
#define VERSION_H
#undef VERSION_H
#include "../../Mx-MicroClient/src/version.h"

#undef VER_PRODUCTVERSION_STR
#ifdef KIT_QT5
#define VER_PRODUCTVERSION_STR      VER_VERSION_STR " 32bit"
#else
#define VER_PRODUCTVERSION_STR      VER_VERSION_STR " 64bit"
#endif

#define VER_FILEVERSION             VER_PRODUCTVERSION
#define VER_FILEVERSION_STR         VER_VERSION_STR "." VALUE_TO_STR(VER_CODE)

#undef VER_INTERNALNAME_STR
#undef VER_ORIGINALFILENAME_STR
#if defined KIT_MINGW && defined KIT_QT6
#define VER_INTERNALNAME_STR        "明曦微端 " VER_PRODUCTVERSION_STR ".dll"
#define VER_ORIGINALFILENAME_STR    "Mx-MicroClient.dll"
#elif defined KIT_MINGW && defined KIT_QT5
#define VER_INTERNALNAME_STR        "明曦微端 " VER_PRODUCTVERSION_STR ".E.dll"
#define VER_ORIGINALFILENAME_STR    "Mx-MicroClient E.dll"
#else
//#define VER_FILEDESCRIPTION_STR     "明曦微端(Pro版)"
#define VER_INTERNALNAME_STR        "明曦微端 " VER_PRODUCTVERSION_STR ".Pro.dll"
#define VER_ORIGINALFILENAME_STR    "Mx-MicroClient Pro.dll"
//#define VER_PRODUCTNAME_STR         "Mx-MicroClient Pro"
#endif

#undef VER_LEGALCOPYRIGHT_STR
#define VER_LEGALCOPYRIGHT_STR      "Copyright (c) 2023 明曦开发者团队.All rights reserved."

#endif // VERSION_H
