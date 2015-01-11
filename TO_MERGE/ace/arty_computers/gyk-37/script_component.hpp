#define COMPONENT sys_arty_computers_gyk37
#include "\x\ace\addons\main\script_mod.hpp"
#include "\x\ace\addons\main\script_dialog_defines.hpp"

#ifdef DEBUG_ENABLED_SYS_ARTY_COMPUTERS_GYK37
	#define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SYS_ARTY_COMPUTERS_GYK37
	#define DEBUG_SETTINGS DEBUG_SETTINGS_SYS_ARTY_CONPUTERS_GYK37
#endif

#include "\x\ace\addons\main\script_macros.hpp"

// global define values for within this module

#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC

#define GETELEV(T,I) ((##T## select ##I##) select 0)
#define GETMAXHEIGHT(T,I) ((##T## select ##I##) select 1)
#define GETSLICES(T,I) ((##T## select ##I##) select 2)

// Rocket ballistics values
#define GETOFFSETH(T,I) ((##T## select ##I##) select 3)
#define GETOFFSETV(T,I) ((##T## select ##I##) select 4)
#define GETDECAYELEV(T,I) ((##T## select ##I##) select 5)
#define GETDECAYSPD(T,I) ((##T## select ##I##) select 6)

// fnc_firingSolution used
#define ELEVATION(sol)	(floor DEG2MIL((sol select 0)))
#define TOF(sol)		((sol select 2))


#define PREP(var1) TRIPLES(PREFIX,COMPONENT,DOUBLES(fnc,var1)) = COMPILE_FILE2(\x\ace\addons\sys_arty_computers\gyk-37\DOUBLES(fnc,var1).sqf)

#define configNamespace		configFile

#include "IDC.hpp"

#include "script_bcs_macros.hpp"

#define ARR_1(arg1)											arg1
#define ARR_2(arg1,arg2)									arg1, arg2
#define ARR_3(arg1,arg2,arg3)								arg1, arg2, arg3
#define ARR_4(arg1,arg2,arg3,arg4)							arg1, arg2, arg3, arg4
#define ARR_5(arg1,arg2,arg3,arg4,arg5)						arg1, arg2, arg3, arg4, arg5
#define ARR_6(arg1,arg2,arg3,arg4,arg5,arg6)				arg1, arg2, arg3, arg4, arg5, arg6
#define ARR_7(arg1,arg2,arg3,arg4,arg5,arg6,arg7)			arg1, arg2, arg3, arg4, arg5, arg6, arg7
#define ARR_8(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)		arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8