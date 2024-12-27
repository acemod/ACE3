#ifdef __A3_DEBUG__
    #define _ZRN_DEBUG_
#endif

// CBA Settings
#define SET(var1) TRIPLES(ADDON,set,var1)
#define QSET(var1) Q(SET(var1))
#define QQSET(var1) QQ(SET(var1))
#define ESET(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),SET,var2)
#define QESET(var1,var2) Q(ESET(var1,var2))
#define QQESET(var1,var2) QQ(ESET(var1,var2))

// Stringtable.xml - use LSTRING() instead
// #define XML(var1) TRIPLES(STR,ADDON,var1)
// #define QXML(var1) Q(XML(var1))
#define SETLSTRING(key) [LSTRING(DOUBLES(set,key)),LSTRING(TRIPLES(set,key,desc))]

// hashMapObjects
#define OGET(var1) (_self get Q(var1))
#define OSET(var1,var2) (_self set [Q(var1), var2])

// Quotes
#ifndef QUOTE
    #define QUOTE(var1) #var1
#endif
#define QQUOTE(var1) QUOTE(QUOTE(var1))
#define Q(var1) QUOTE(var1)
#define QQ(var1) QQUOTE(var1)

#define QADDON Q(ADDON)
#define QPREFIX Q(PREFIX)
#define QCOMPONENT Q(COMPONENT)

// Prefix Function
#define PFUNC(var1) TRIPLES(PREFIX,fnc,var1)
#define QPFUNC(var1) QUOTE(PFUNC(var1))
#define QQPFUNC(var1) QUOTE(QPFUNC(var1))


// Prefix Variables
#define PVAR(var1) DOUBLES(PREFIX,var1)
#define QPVAR(var1) QUOTE(PVAR(var1))
#define QQPVAR(var1) QUOTE(QPVAR(var1))

// Component Variables
#define CVAR(var1) DOUBLES(COMPONENT,var1)
#define QCVAR(var1) QUOTE(CVAR(var1))
#define QQCVAR(var1) QUOTE(QCVAR(var1))

// missionNamespace set/get Variables

#define SETMGVAR(name,value) (missionNamespace setVariable [QGVAR(name),value])
#define SETMGVAR_PUBLIC(name,value,public) (missionNamespace setVariable [QGVAR(name),value,public])

#define GETMGVAR(name,default) (missionNamespace getVariable [QGVAR(name),default])

// CfgPatches Stuff
#ifndef PREFIX_BEAUTIFIED
    #define PREFIX_BEAUTIFIED PREFIX
#endif
#ifndef COMPONENT_BEAUTIFIED
    #define COMPONENT_BEAUTIFIED COMPONENT
#endif

#define ADDON_NAME Q(PREFIX_BEAUTIFIED - COMPONENT_BEAUTIFIED)

// Paths
#define PATH_TO_FUNC QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\functions)
#define PATH_TO_FUNC_SUB(var1) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\functions\var1)
#define PATH_TO_ADDON(var1) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\var1)
#define PATH_TO_ADDON_2(var1,var2) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\var1\var2)
#define PATH_TO_ADDON_3(var1,var2,var3) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\var1\var2\var3)

#define QPATH_TO_ADDON(var1) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\var1)
#define QQPATH_TO_ADDON(var1) Q(QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\var1))

// Debug
// Doesnt seem to work currently 
#ifdef _ZRN_DEBUG_
    #define _DEBUG_POSTINIT_ postInit = 1;
    #define _DEBUG_PREINIT_ preInit = 1;
#else
    #define _DEBUG_POSTINIT_ postInit = 0;
    #define _DEBUG_PREINIT_ preInit = 0;
#endif


#define DEBUG_HEADER format [QUOTE([PREFIX][COMPONENT](%1)),_fnc_scriptName]

#define ZRN_LOG_MSG(MSG) diag_log (DEBUG_HEADER + " " + QUOTE(MSG))

#ifdef _ZRN_DEBUG_
    #define ZRN_SCRIPTNAME(var1) private _fnc_scriptName = Q(var1)

    #define ZRN_LOG_MSG_1(MSG,A) diag_log (DEBUG_HEADER + (format [' %1 - A: %2',QUOTE(MSG),RETNIL(A)]))
    #define ZRN_LOG_MSG_2(MSG,A,B) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3',QUOTE(MSG),RETNIL(A),RETNIL(B)]))
    #define ZRN_LOG_MSG_3(MSG,A,B,C) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C)]))
    #define ZRN_LOG_MSG_4(MSG,A,B,C,D) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4 - D: %5',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D)]))
    #define ZRN_LOG_MSG_5(MSG,A,B,C,D,E) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4 - D: %5 - E: %6',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E)]))
    #define ZRN_LOG_MSG_6(MSG,A,B,C,D,E,F) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4 - D: %5 - E: %6 - F: %7',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F)]))
    #define ZRN_LOG_MSG_7(MSG,A,B,C,D,E,F,G) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4 - D: %5 - E: %6 - F: %7 - H: %8',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F),RETNIL(G)]))
    #define ZRN_LOG_MSG_8(MSG,A,B,C,D,E,F,G,H) diag_log (DEBUG_HEADER + (format [' %1 - A: %2 - B: %3 - C: %4 - D: %5 - E: %6 - F: %7 - H: %8 - I: %9',QUOTE(MSG),RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F),RETNIL(G),RETNIL(H)]))

    #define ZRN_LOG_1(A) diag_log (DEBUG_HEADER + (format [' A: %1',RETNIL(A)]))
    #define ZRN_LOG_2(A,B) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2',RETNIL(A),RETNIL(B)]))
    #define ZRN_LOG_3(A,B,C) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3',RETNIL(A),RETNIL(B),RETNIL(C)]))
    #define ZRN_LOG_4(A,B,C,D) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3 - D: %4',RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D)]))
    #define ZRN_LOG_5(A,B,C,D,E) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3 - D: %4 - E: %5',RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E)]))
    #define ZRN_LOG_6(A,B,C,D,E,F) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3 - D: %4 - E: %5 - F: %6',RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F)]))
    #define ZRN_LOG_7(A,B,C,D,E,F,G) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3 - D: %4 - E: %5 - F: %6 - H: %7',RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F),RETNIL(G)]))
    #define ZRN_LOG_8(A,B,C,D,E,F,G,H) diag_log (DEBUG_HEADER + (format [' A: %1 - B: %2 - C: %3 - D: %4 - E: %5 - F: %6 - H: %7 - I: %8',RETNIL(A),RETNIL(B),RETNIL(C),RETNIL(D),RETNIL(E),RETNIL(F),RETNIL(G),RETNIL(H)]))

    #define ZRN_LOG_HMO(var1) { if ('#' in _x || 'Meth' in _x) then {continue}; diag_log (DEBUG_HEADER + (format [' %3 - %1 - %2', _x, _y, Q(MSG)])) } forEach var1;
    #define ZRN_LOG_MSG_HMO(MSG,var1) { if ('#' in _x || 'Meth' in _x) then {continue}; diag_log (DEBUG_HEADER + (format [' %3 - %1 - %2', _x, _y, Q(MSG)])) } forEach var1;

#else
    #define ZRN_SCRIPTNAME(var1)

    #define ZRN_LOG_MSG_1(MSG,A)
    #define ZRN_LOG_MSG_2(MSG,A,B)
    #define ZRN_LOG_MSG_3(MSG,A,B,C)
    #define ZRN_LOG_MSG_4(MSG,A,B,C,D)
    #define ZRN_LOG_MSG_5(MSG,A,B,C,D,E)
    #define ZRN_LOG_MSG_6(MSG,A,B,C,D,E,F)
    #define ZRN_LOG_MSG_7(MSG,A,B,C,D,E,F,G)
    #define ZRN_LOG_MSG_8(MSG,A,B,C,D,E,F,G,H)

    #define ZRN_LOG_1(A)
    #define ZRN_LOG_2(A,B)
    #define ZRN_LOG_3(A,B,C)
    #define ZRN_LOG_4(A,B,C,D)
    #define ZRN_LOG_5(A,B,C,D,E)
    #define ZRN_LOG_6(A,B,C,D,E,F)
    #define ZRN_LOG_7(A,B,C,D,E,F,G)
    #define ZRN_LOG_8(A,B,C,D,E,F,G,H)

    #define ZRN_LOG_HMO(var1)
    #define ZRN_LOG_MSG_HMO(MSG,var1)
#endif