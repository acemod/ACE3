
// This file is only for use within ACE, you would not use this when creating 3rd party apps in stand-alone PBO's

// Before including this file, you need to 
// #define APPNAME abc // This is the subfolder in the tacphone/apps/ folder
// #define COMPONENT_BEAUTIFIED Tacphone App ABC

#define COMPONENT DOUBLES(tacphone,APPNAME)


#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TACPHONE // Enabling debug for Tacphone, enables it for all apps too
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TACPHONE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TACPHONE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// We need to change some things because we are using a subfolder

#undef GVAR
#define GVAR(var1) DOUBLES(TRIPLES(PREFIX,tacphone,APPNAME),var1)
#undef PATHTO
#define PATHTO(var1) PATHTO_SYS(PREFIX,tacphone\apps\APPNAME,var1)
#undef PATHTOF
#define PATHTOF(var1) PATHTOF_SYS(PREFIX,tacphone\apps\APPNAME,var1)
#undef COMPILE_SCRIPT
#define COMPILE_SCRIPT(var1) compileScript ['PATHTO_SYS(PREFIX,tacphone\apps\APPNAME,var1)']
#undef COMPILE_FILE_SYS
#define COMPILE_FILE_SYS(var1,var2,var3) COMPILE_FILE2_SYS('PATHTO_SYS(var1,tacphone\apps\APPNAME,var3)')
#undef COMPILE_FILE_CFG_SYS
#define COMPILE_FILE_CFG_SYS(var1,var2,var3) COMPILE_FILE2_CFG_SYS('PATHTO_SYS(var1,tacphone\apps\APPNAME,var3)')

