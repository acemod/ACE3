#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

//Faster Array Unwraping (skips the IS_ARRAY check normaly found in EXPLODE_1_SYS)
#undef EXPLODE_2_SYS
#define EXPLODE_1_SYS_FAST(ARRAY,A) A =(ARRAY) select 0
#define EXPLODE_2_SYS(ARRAY,A,B) EXPLODE_1_SYS_FAST(ARRAY,A); B = (ARRAY) select 1

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

#define EGVAR(module,var) TRIPLES(PREFIX,module,var)
#define QEGVAR(module,var) QUOTE(EGVAR(module,var))

#define DGVAR(varName)    if(isNil "ACE_DEBUG_NAMESPACE") then { ACE_DEBUG_NAMESPACE = []; }; if(!(QUOTE(GVAR(varName)) in ACE_DEBUG_NAMESPACE)) then { PUSH(ACE_DEBUG_NAMESPACE, QUOTE(GVAR(varName))); }; GVAR(varName)
#define DVAR(varName)     if(isNil "ACE_DEBUG_NAMESPACE") then { ACE_DEBUG_NAMESPACE = []; }; if(!(QUOTE(varName) in ACE_DEBUG_NAMESPACE)) then { PUSH(ACE_DEBUG_NAMESPACE, QUOTE(varName)); }; varName
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)

#define STRING(var1) QUOTE(TRIPLES(STR,ADDON,var1))
#define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))

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


#include "script_debug.hpp"