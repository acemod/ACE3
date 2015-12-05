#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

#define DGVAR(varName)    if(isNil "ACE_DEBUG_NAMESPACE") then { ACE_DEBUG_NAMESPACE = []; }; if(!(QUOTE(GVAR(varName)) in ACE_DEBUG_NAMESPACE)) then { PUSH(ACE_DEBUG_NAMESPACE, QUOTE(GVAR(varName))); }; GVAR(varName)
#define DVAR(varName)     if(isNil "ACE_DEBUG_NAMESPACE") then { ACE_DEBUG_NAMESPACE = []; }; if(!(QUOTE(varName) in ACE_DEBUG_NAMESPACE)) then { PUSH(ACE_DEBUG_NAMESPACE, QUOTE(varName)); }; varName
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)

#define ARR_SELECT(ARRAY,INDEX,DEFAULT) if (count ARRAY > INDEX) then {ARRAY select INDEX} else {DEFAULT}


#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
  weapon = #WEAPON; \
  count = COUNT; \
}

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
}

#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
  magazine = #MAGAZINE; \
  count = COUNT; \
}

#define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
  backpack = #BACKPACK; \
  count = COUNT; \
}


#ifdef DISABLE_COMPILE_CACHE
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf))
#else
    #define PREP(fncName) DFUNC(fncName) = QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf)) call SLX_XEH_COMPILE
#endif

#define PREP_MODULE(folder) [] call compile preprocessFileLineNumbers QUOTE(PATHTOF(folder\__PREP__.sqf))

#define HASH_CREATE                    ([] call EFUNC(common,hashCreate))
#define HASH_SET(hash, key, val)    ([hash, key, val, __FILE__, __LINE__] call EFUNC(common,hashSet))
#define HASH_GET(hash, key)            ([hash, key, __FILE__, __LINE__] call EFUNC(common,hashGet))
#define HASH_REM(hash, key)            ([hash, key, __FILE__, __LINE__] call EFUNC(common,hashRem))
#define HASH_HASKEY(hash, key)        ([hash, key, __FILE__, __LINE__] call EFUNC(common,hashHasKey))

#define HASHLIST_CREATELIST(keys)                ([keys] call EFUNC(common,hashListCreateList))
#define HASHLIST_CREATEHASH(hashList)            ([hashList] call EFUNC(common,hashListCreateHash))
#define HASHLIST_SELECT(hashList, index)        ([hashList, index, __FILE__, __LINE__] call EFUNC(common,hashListSelect))
#define HASHLIST_SET(hashList, index, value)    ([hashList, index, value, __FILE__, __LINE__] call EFUNC(common,hashListSet))
#define HASHLIST_PUSH(hashList, value)            ([hashList, value, __FILE__, __LINE__] call EFUNC(common,hashListPush))

// Time functions for accuracy per frame
#define ACE_tickTime (ACE_time + (diag_tickTime - ACE_diagTime))

#define ACE_isHC (!hasInterface && !isDedicated)

//By default CBA's TRACE/LOG/WARNING spawn a buffer, which can cause messages to be logged out of order:
#ifdef CBA_DEBUG_SYNCHRONOUS
    #define CBA_fnc_log { params ["_file","_lineNum","_message"]; diag_log [diag_frameNo, diag_tickTime, time,  _file + ":"+str(_lineNum + 1), _message]; }
#endif

#define ACE_LOG(module,level,message) diag_log text ACE_LOGFORMAT(module,level,message)
#define ACE_LOGFORMAT(module,level,message) FORMAT_2(QUOTE([ACE] (module) %1: %2),level,message)

#define ACE_LOGERROR(message) ACE_LOG(COMPONENT,"ERROR",message)
#define ACE_LOGERROR_1(message,arg1) ACE_LOGERROR(FORMAT_1(message,arg1))
#define ACE_LOGERROR_2(message,arg1,arg2) ACE_LOGERROR(FORMAT_2(message,arg1,arg2))
#define ACE_LOGERROR_3(message,arg1,arg2,arg3) ACE_LOGERROR(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_LOGERROR_4(message,arg1,arg2,arg3,arg4) ACE_LOGERROR(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_LOGERROR_5(message,arg1,arg2,arg3,arg4,arg5) ACE_LOGERROR(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_LOGERROR_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_LOGERROR(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_LOGERROR_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_LOGERROR(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_LOGERROR_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_LOGERROR(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_ERRORFORMAT(message) ACE_LOGFORMAT(COMPONENT,"ERROR",message)
#define ACE_ERRORFORMAT_1(message,arg1) ACE_ERRORFORMAT(FORMAT_1(message,arg1))
#define ACE_ERRORFORMAT_2(message,arg1,arg2) ACE_ERRORFORMAT(FORMAT_2(message,arg1,arg2))
#define ACE_ERRORFORMAT_3(message,arg1,arg2,arg3) ACE_ERRORFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_ERRORFORMAT_4(message,arg1,arg2,arg3,arg4) ACE_ERRORFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_ERRORFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) ACE_ERRORFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_ERRORFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_ERRORFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_ERRORFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_ERRORFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_ERRORFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_ERRORFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_LOGWARNING(message) ACE_LOG(COMPONENT,"WARNING",message)
#define ACE_LOGWARNING_1(message,arg1) ACE_LOGWARNING(FORMAT_1(message,arg1))
#define ACE_LOGWARNING_2(message,arg1,arg2) ACE_LOGWARNING(FORMAT_2(message,arg1,arg2))
#define ACE_LOGWARNING_3(message,arg1,arg2,arg3) ACE_LOGWARNING(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_LOGWARNING_4(message,arg1,arg2,arg3,arg4) ACE_LOGWARNING(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_LOGWARNING_5(message,arg1,arg2,arg3,arg4,arg5) ACE_LOGWARNING(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_LOGWARNING_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_LOGWARNING(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_LOGWARNING_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_LOGWARNING(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_LOGWARNING_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_LOGWARNING(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_WARNINGFORMAT(message) ACE_LOGFORMAT(COMPONENT,"WARNING",message)
#define ACE_WARNINGFORMAT_1(message,arg1) ACE_WARNINGFORMAT(FORMAT_1(message,arg1))
#define ACE_WARNINGFORMAT_2(message,arg1,arg2) ACE_WARNINGFORMAT(FORMAT_2(message,arg1,arg2))
#define ACE_WARNINGFORMAT_3(message,arg1,arg2,arg3) ACE_WARNINGFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_WARNINGFORMAT_4(message,arg1,arg2,arg3,arg4) ACE_WARNINGFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_WARNINGFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) ACE_WARNINGFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_WARNINGFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_WARNINGFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_WARNINGFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_WARNINGFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_WARNINGFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_WARNINGFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_LOGINFO(message) ACE_LOG(COMPONENT,"INFO",message)
#define ACE_LOGINFO_1(message,arg1) ACE_LOGINFO(FORMAT_1(message,arg1))
#define ACE_LOGINFO_2(message,arg1,arg2) ACE_LOGINFO(FORMAT_2(message,arg1,arg2))
#define ACE_LOGINFO_3(message,arg1,arg2,arg3) ACE_LOGINFO(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_LOGINFO_4(message,arg1,arg2,arg3,arg4) ACE_LOGINFO(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_LOGINFO_5(message,arg1,arg2,arg3,arg4,arg5) ACE_LOGINFO(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_LOGINFO_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_LOGINFO(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_LOGINFO_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_LOGINFO(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_LOGINFO_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_LOGINFO(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_INFOFORMAT(message) ACE_LOGFORMAT(COMPONENT,"INFO",message)
#define ACE_INFOFORMAT_1(message,arg1) ACE_INFOFORMAT(FORMAT_1(message,arg1))
#define ACE_INFOFORMAT_2(message,arg1,arg2) ACE_INFOFORMAT(FORMAT_2(message,arg1,arg2))
#define ACE_INFOFORMAT_3(message,arg1,arg2,arg3) ACE_INFOFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_INFOFORMAT_4(message,arg1,arg2,arg3,arg4) ACE_INFOFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_INFOFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) ACE_INFOFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_INFOFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_INFOFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_INFOFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_INFOFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_INFOFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_INFOFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_LOGDEBUG(message) ACE_LOG(COMPONENT,"DEBUG",message)
#define ACE_LOGDEBUG_1(message,arg1) ACE_LOGDEBUG(FORMAT_1(message,arg1))
#define ACE_LOGDEBUG_2(message,arg1,arg2) ACE_LOGDEBUG(FORMAT_2(message,arg1,arg2))
#define ACE_LOGDEBUG_3(message,arg1,arg2,arg3) ACE_LOGDEBUG(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_LOGDEBUG_4(message,arg1,arg2,arg3,arg4) ACE_LOGDEBUG(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_LOGDEBUG_5(message,arg1,arg2,arg3,arg4,arg5) ACE_LOGDEBUG(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_LOGDEBUG_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_LOGDEBUG(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_LOGDEBUG_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_LOGDEBUG(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_LOGDEBUG_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_LOGDEBUG(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_DEBUGFORMAT(message) ACE_LOGFORMAT(COMPONENT,"DEBUG",message)
#define ACE_DEBUGFORMAT_1(message,arg1) ACE_DEBUGFORMAT(FORMAT_1(message,arg1))
#define ACE_DEBUGFORMAT_2(message,arg1,arg2) ACE_DEBUGFORMAT(FORMAT_2(message,arg1,arg2))
#define ACE_DEBUGFORMAT_3(message,arg1,arg2,arg3) ACE_DEBUGFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define ACE_DEBUGFORMAT_4(message,arg1,arg2,arg3,arg4) ACE_DEBUGFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define ACE_DEBUGFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) ACE_DEBUGFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define ACE_DEBUGFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) ACE_DEBUGFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define ACE_DEBUGFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) ACE_DEBUGFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define ACE_DEBUGFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) ACE_DEBUGFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define ACE_DEPRECATED(arg1,arg2,arg3) ACE_LOGWARNING_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3",arg1,arg2,arg3)

#include "script_debug.hpp"
