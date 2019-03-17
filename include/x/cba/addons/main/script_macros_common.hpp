/*
    Header: script_macros_common.hpp

    Description:
        A general set of useful macro functions for use by CBA itself or by any module that uses CBA.

    Authors:
        Sickboy <sb_at_dev-heaven.net> and Spooner
*/

/* ****************************************************
 New - Should be exported to general addon
 Aim:
   - Simplify (shorten) the amount of characters required for repetitive tasks
   - Provide a solid structure that can be dynamic and easy editable (Which sometimes means we cannot adhere to Aim #1 ;-)
     An example is the path that is built from defines. Some available in this file, others in mods and addons.

 Follows  Standard:
   Object variables: PREFIX_COMPONENT
   Main-object variables: PREFIX_main
   Paths: MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\SCRIPTNAME.sqf
   e.g: x\six\addons\sys_menu\fDate.sqf

 Usage:
   define PREFIX and COMPONENT, then include this file
   (Note, you could have a main addon for your mod, define the PREFIX in a macros.hpp,
   and include this script_macros_common.hpp file.
   Then in your addons, add a component.hpp, define the COMPONENT,
   and include your mod's script_macros.hpp
   In your scripts you can then include the addon's component.hpp with relative path)

 TODO:
   - Try only to use 1 string type " vs '
   - Evaluate double functions, and simplification
   - Evaluate naming scheme; current = prototype
   - Evaluate "Debug" features..
   - Evaluate "create mini function per precompiled script, that will load the script on first usage, rather than on init"
   - Also saw "Namespace" typeName, evaluate which we need :P
   - Single/Multi player gamelogics? (Incase of MP, you would want only 1 gamelogic per component, which is pv'ed from server, etc)
 */

#ifndef MAINPREFIX
    #define MAINPREFIX x
#endif

#ifndef SUBPREFIX
    #define SUBPREFIX addons
#endif

#ifndef MAINLOGIC
    #define MAINLOGIC main
#endif

#ifndef VERSION
    #define VERSION 0
#endif

#ifndef VERSION_AR
    #define VERSION_AR VERSION
#endif

#ifndef VERSION_CONFIG
    #define VERSION_CONFIG version = VERSION; versionStr = QUOTE(VERSION); versionAr[] = {VERSION_AR}
#endif

#define ADDON DOUBLES(PREFIX,COMPONENT)
#define MAIN_ADDON DOUBLES(PREFIX,main)

/* -------------------------------------------
Group: Debugging
------------------------------------------- */

/* -------------------------------------------
Macros: DEBUG_MODE_x
    Managing debugging based on debug level.

    According to the *highest* level of debugging that has been defined *before* script_macros_common.hpp is included,
    only the appropriate debugging commands will be functional. With no level explicitely defined, assume DEBUG_MODE_NORMAL.

    DEBUG_MODE_FULL - Full debugging output.
    DEBUG_MODE_NORMAL - All debugging except <TRACE_n()> and <LOG()> (Default setting if none specified).
    DEBUG_MODE_MINIMAL - Only <ERROR()> and <ERROR_WITH_TITLE()> enabled.

Examples:
    In order to turn on full debugging for a single file,
    (begin example)
        // Top of individual script file.
        #define DEBUG_MODE_FULL
        #include "script_component.hpp"
    (end)

    In order to force minimal debugging for a single component,
    (begin example)
        // Top of addons\<component>\script_component.hpp
        // Ensure that any FULL and NORMAL setting from the individual files are undefined and MINIMAL is set.
        #ifdef DEBUG_MODE_FULL
        #undef DEBUG_MODE_FULL
        #endif
        #ifdef DEBUG_MODE_NORMAL
        #undef DEBUG_MODE_NORMAL
        #endif
        #ifndef DEBUG_MODE_MINIMAL
        #define DEBUG_MODE_MINIMAL
        #endif
        #include "script_macros.hpp"
    (end)

    In order to turn on full debugging for a whole addon,
    (begin example)
        // Top of addons\main\script_macros.hpp
        #ifndef DEBUG_MODE_FULL
        #define DEBUG_MODE_FULL
        #endif
        #include "\x\cba\addons\main\script_macros_common.hpp"
    (end)

Author:
    Spooner
------------------------------------------- */

// If DEBUG_MODE_FULL, then also enable DEBUG_MODE_NORMAL.
#ifdef DEBUG_MODE_FULL
#define DEBUG_MODE_NORMAL
#endif

// If DEBUG_MODE_NORMAL, then also enable DEBUG_MODE_MINIMAL.
#ifdef DEBUG_MODE_NORMAL
#define DEBUG_MODE_MINIMAL
#endif

// If no debug modes specified, use DEBUG_MODE_NORMAL (+ DEBUG_MODE_MINIMAL).
#ifndef DEBUG_MODE_MINIMAL
#define DEBUG_MODE_NORMAL
#define DEBUG_MODE_MINIMAL
#endif

#define LOG_SYS_FORMAT(LEVEL,MESSAGE) format ['[%1] (%2) %3: %4', toUpper 'PREFIX', 'COMPONENT', LEVEL, MESSAGE]

#ifdef DEBUG_SYNCHRONOUS
#define LOG_SYS(LEVEL,MESSAGE) diag_log text LOG_SYS_FORMAT(LEVEL,MESSAGE)
#else
#define LOG_SYS(LEVEL,MESSAGE) LOG_SYS_FORMAT(LEVEL,MESSAGE) call CBA_fnc_log
#endif

#define LOG_SYS_FILELINENUMBERS(LEVEL,MESSAGE) LOG_SYS(LEVEL,format [ARR_4('%1 %2:%3',MESSAGE,__FILE__,__LINE__ + 1)])

/* -------------------------------------------
Macro: LOG()
    Log a debug message into the RPT log.

    Only run if <DEBUG_MODE_FULL> is defined.

Parameters:
    MESSAGE - Message to record <STRING>

Example:
    (begin example)
        LOG("Initiated clog-dancing simulator.");
    (end)

Author:
    Spooner
------------------------------------------- */
#ifdef DEBUG_MODE_FULL

#define LOG(MESSAGE) LOG_SYS_FILELINENUMBERS('LOG',MESSAGE)
#define LOG_1(MESSAGE,ARG1) LOG(FORMAT_1(MESSAGE,ARG1))
#define LOG_2(MESSAGE,ARG1,ARG2) LOG(FORMAT_2(MESSAGE,ARG1,ARG2))
#define LOG_3(MESSAGE,ARG1,ARG2,ARG3) LOG(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define LOG_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) LOG(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define LOG_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) LOG(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define LOG_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) LOG(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define LOG_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) LOG(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define LOG_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) LOG(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

#else

#define LOG(MESSAGE) /* disabled */
#define LOG_1(MESSAGE,ARG1) /* disabled */
#define LOG_2(MESSAGE,ARG1,ARG2) /* disabled */
#define LOG_3(MESSAGE,ARG1,ARG2,ARG3) /* disabled */
#define LOG_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) /* disabled */
#define LOG_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) /* disabled */
#define LOG_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) /* disabled */
#define LOG_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) /* disabled */
#define LOG_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) /* disabled */

#endif

/* -------------------------------------------
Macro: INFO()
    Record a message without file and line number in the RPT log.

Parameters:
    MESSAGE - Message to record <STRING>

Example:
    (begin example)
        INFO("Mod X is loaded, do Y");
    (end)

Author:
    commy2
------------------------------------------- */
#define INFO(MESSAGE) LOG_SYS('INFO',MESSAGE)
#define INFO_1(MESSAGE,ARG1) INFO(FORMAT_1(MESSAGE,ARG1))
#define INFO_2(MESSAGE,ARG1,ARG2) INFO(FORMAT_2(MESSAGE,ARG1,ARG2))
#define INFO_3(MESSAGE,ARG1,ARG2,ARG3) INFO(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define INFO_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) INFO(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define INFO_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) INFO(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define INFO_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) INFO(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define INFO_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) INFO(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define INFO_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) INFO(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

/* -------------------------------------------
Macro: WARNING()
    Record a non-critical error in the RPT log.

    Only run if <DEBUG_MODE_NORMAL> or higher is defined.

Parameters:
    MESSAGE - Message to record <STRING>

Example:
    (begin example)
        WARNING("This function has been deprecated. Please don't use it in future!");
    (end)

Author:
    Spooner
------------------------------------------- */
#ifdef DEBUG_MODE_NORMAL

#define WARNING(MESSAGE) LOG_SYS_FILELINENUMBERS('WARNING',MESSAGE)
#define WARNING_1(MESSAGE,ARG1) WARNING(FORMAT_1(MESSAGE,ARG1))
#define WARNING_2(MESSAGE,ARG1,ARG2) WARNING(FORMAT_2(MESSAGE,ARG1,ARG2))
#define WARNING_3(MESSAGE,ARG1,ARG2,ARG3) WARNING(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define WARNING_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) WARNING(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define WARNING_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) WARNING(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define WARNING_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) WARNING(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define WARNING_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) WARNING(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define WARNING_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) WARNING(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

#else

#define WARNING(MESSAGE) /* disabled */
#define WARNING_1(MESSAGE,ARG1) /* disabled */
#define WARNING_2(MESSAGE,ARG1,ARG2) /* disabled */
#define WARNING_3(MESSAGE,ARG1,ARG2,ARG3) /* disabled */
#define WARNING_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) /* disabled */
#define WARNING_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) /* disabled */
#define WARNING_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) /* disabled */
#define WARNING_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) /* disabled */
#define WARNING_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) /* disabled */

#endif

/* -------------------------------------------
Macro: ERROR()
    Record a critical error in the RPT log.

Parameters:
    MESSAGE -  Message to record <STRING>

Example:
    (begin example)
        ERROR("value of frog not found in config ...yada...yada...");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ERROR(MESSAGE) LOG_SYS_FILELINENUMBERS('ERROR',MESSAGE)
#define ERROR_1(MESSAGE,ARG1) ERROR(FORMAT_1(MESSAGE,ARG1))
#define ERROR_2(MESSAGE,ARG1,ARG2) ERROR(FORMAT_2(MESSAGE,ARG1,ARG2))
#define ERROR_3(MESSAGE,ARG1,ARG2,ARG3) ERROR(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define ERROR_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) ERROR(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define ERROR_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) ERROR(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define ERROR_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ERROR(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define ERROR_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ERROR(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define ERROR_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ERROR(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

/* -------------------------------------------
Macro: ERROR_MSG()
    Record a critical error in the RPT log and display on screen error message.

    Newlines (\n) in the MESSAGE will be put on separate lines.

Parameters:
    MESSAGE -  Message to record <STRING>

Example:
    (begin example)
        ERROR_MSG("value of frog not found in config ...yada...yada...");
    (end)

Author:
    commy2
------------------------------------------- */
#define ERROR_MSG(MESSAGE) ['PREFIX', 'COMPONENT', nil, MESSAGE, __FILE__, __LINE__ + 1] call CBA_fnc_error
#define ERROR_MSG_1(MESSAGE,ARG1) ERROR_MSG(FORMAT_1(MESSAGE,ARG1))
#define ERROR_MSG_2(MESSAGE,ARG1,ARG2) ERROR_MSG(FORMAT_2(MESSAGE,ARG1,ARG2))
#define ERROR_MSG_3(MESSAGE,ARG1,ARG2,ARG3) ERROR_MSG(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define ERROR_MSG_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) ERROR_MSG(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define ERROR_MSG_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) ERROR_MSG(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define ERROR_MSG_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ERROR_MSG(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define ERROR_MSG_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ERROR_MSG(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define ERROR_MSG_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ERROR_MSG(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

/* -------------------------------------------
Macro: ERROR_WITH_TITLE()
    Record a critical error in the RPT log.

    The title can be specified (in <ERROR()> the heading is always just "ERROR")
    Newlines (\n) in the MESSAGE will be put on separate lines.

Parameters:
    TITLE - Title of error message <STRING>
    MESSAGE -  Body of error message <STRING>

Example:
    (begin example)
        ERROR_WITH_TITLE("Value not found","Value of frog not found in config ...yada...yada...");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ERROR_WITH_TITLE(TITLE,MESSAGE) ['PREFIX', 'COMPONENT', TITLE, MESSAGE, __FILE__, __LINE__ + 1] call CBA_fnc_error
#define ERROR_WITH_TITLE_1(TITLE,MESSAGE,ARG1) ERROR_WITH_TITLE(TITLE,FORMAT_1(MESSAGE,ARG1))
#define ERROR_WITH_TITLE_2(TITLE,MESSAGE,ARG1,ARG2) ERROR_WITH_TITLE(TITLE,FORMAT_2(MESSAGE,ARG1,ARG2))
#define ERROR_WITH_TITLE_3(TITLE,MESSAGE,ARG1,ARG2,ARG3) ERROR_WITH_TITLE(TITLE,FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define ERROR_WITH_TITLE_4(TITLE,MESSAGE,ARG1,ARG2,ARG3,ARG4) ERROR_WITH_TITLE(TITLE,FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define ERROR_WITH_TITLE_5(TITLE,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) ERROR_WITH_TITLE(TITLE,FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define ERROR_WITH_TITLE_6(TITLE,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ERROR_WITH_TITLE(TITLE,FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define ERROR_WITH_TITLE_7(TITLE,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ERROR_WITH_TITLE(TITLE,FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define ERROR_WITH_TITLE_8(TITLE,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ERROR_WITH_TITLE(TITLE,FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

/* -------------------------------------------
Macro: MESSAGE_WITH_TITLE()
    Record a single line in the RPT log.

Parameters:
    TITLE - Title of log message <STRING>
    MESSAGE -  Body of message <STRING>

Example:
    (begin example)
        MESSAGE_WITH_TITLE("Value found","Value of frog found in config <someconfig>");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define MESSAGE_WITH_TITLE(TITLE,MESSAGE) LOG_SYS_FILELINENUMBERS(TITLE,MESSAGE)

/* -------------------------------------------
Macro: RETDEF()
    If a variable is undefined, return the default value. Otherwise, return the
    variable itself.

Parameters:
    VARIABLE - the variable to check
    DEFAULT_VALUE - the default value to use if variable is undefined

Example:
    (begin example)
        // _var is undefined
        hintSilent format ["_var=%1", RETDEF(_var,5)]; // "_var=5"
        _var = 7;
        hintSilent format ["_var=%1", RETDEF(_var,5)]; // "_var=7"
    (end example)
Author:
    654wak654
------------------------------------------- */
#define RETDEF(VARIABLE,DEFAULT_VALUE) (if (isNil {VARIABLE}) then [{DEFAULT_VALUE}, {VARIABLE}])

/* -------------------------------------------
Macro: RETNIL()
    If a variable is undefined, return the value nil. Otherwise, return the
    variable itself.

Parameters:
    VARIABLE - the variable to check

Example:
    (begin example)
        // _var is undefined
        hintSilent format ["_var=%1", RETNIL(_var)]; // "_var=any"
    (end example)

Author:
    Alef (see CBA issue #8514)
------------------------------------------- */
#define RETNIL(VARIABLE) RETDEF(VARIABLE,nil)

/* -------------------------------------------
Macros: TRACE_n()
    Log a message and 1-8 variables to the RPT log.

    Only run if <DEBUG_MODE_FULL> is defined.

    TRACE_1(MESSAGE,A) - Log 1 variable.
    TRACE_2(MESSAGE,A,B) - Log 2 variables.
    TRACE_3(MESSAGE,A,B,C) - Log 3 variables.
    TRACE_4(MESSAGE,A,B,C,D) - Log 4 variables.
    TRACE_5(MESSAGE,A,B,C,D,E) - Log 5 variables.
    TRACE_6(MESSAGE,A,B,C,D,E,F) - Log 6 variables.
    TRACE_7(MESSAGE,A,B,C,D,E,F,G) - Log 7 variables.
    TRACE_8(MESSAGE,A,B,C,D,E,F,G,H) - Log 8 variables.
    TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I) - Log 9 variables.

Parameters:
    MESSAGE -  Message to add to the trace [String]
    A..H - Variable names to log values of [Any]

Example:
    (begin example)
        TRACE_3("After takeoff",_vehicle player,getPos (_vehicle player), getPosASL (_vehicle player));
    (end)

Author:
    Spooner
------------------------------------------- */
#define PFORMAT_1(MESSAGE,A) \
    format ['%1: A=%2', MESSAGE, RETNIL(A)]

#define PFORMAT_2(MESSAGE,A,B) \
    format ['%1: A=%2, B=%3', MESSAGE, RETNIL(A), RETNIL(B)]

#define PFORMAT_3(MESSAGE,A,B,C) \
    format ['%1: A=%2, B=%3, C=%4', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C)]

#define PFORMAT_4(MESSAGE,A,B,C,D) \
    format ['%1: A=%2, B=%3, C=%4, D=%5', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D)]

#define PFORMAT_5(MESSAGE,A,B,C,D,E) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E)]

#define PFORMAT_6(MESSAGE,A,B,C,D,E,F) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F)]

#define PFORMAT_7(MESSAGE,A,B,C,D,E,F,G) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G)]

#define PFORMAT_8(MESSAGE,A,B,C,D,E,F,G,H) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H)]

#define PFORMAT_9(MESSAGE,A,B,C,D,E,F,G,H,I) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9, I=%10', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H), RETNIL(I)]


#ifdef DEBUG_MODE_FULL
#define TRACE_1(MESSAGE,A) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_1(str diag_frameNo + ' ' + (MESSAGE),A))
#define TRACE_2(MESSAGE,A,B) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_2(str diag_frameNo + ' ' + (MESSAGE),A,B))
#define TRACE_3(MESSAGE,A,B,C) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_3(str diag_frameNo + ' ' + (MESSAGE),A,B,C))
#define TRACE_4(MESSAGE,A,B,C,D) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_4(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D))
#define TRACE_5(MESSAGE,A,B,C,D,E) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_5(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E))
#define TRACE_6(MESSAGE,A,B,C,D,E,F) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_6(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F))
#define TRACE_7(MESSAGE,A,B,C,D,E,F,G) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_7(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G))
#define TRACE_8(MESSAGE,A,B,C,D,E,F,G,H) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_8(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H))
#define TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_9(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H,I))
#else
#define TRACE_1(MESSAGE,A) /* disabled */
#define TRACE_2(MESSAGE,A,B) /* disabled */
#define TRACE_3(MESSAGE,A,B,C) /* disabled */
#define TRACE_4(MESSAGE,A,B,C,D) /* disabled */
#define TRACE_5(MESSAGE,A,B,C,D,E) /* disabled */
#define TRACE_6(MESSAGE,A,B,C,D,E,F) /* disabled */
#define TRACE_7(MESSAGE,A,B,C,D,E,F,G) /* disabled */
#define TRACE_8(MESSAGE,A,B,C,D,E,F,G,H) /* disabled */
#define TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I) /* disabled */
#endif

/* -------------------------------------------
Group: General
------------------------------------------- */

// *************************************
// Internal Functions
#define DOUBLES(var1,var2) var1##_##var2
#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define QUOTE(var1) #var1

#ifdef MODULAR
    #define COMPONENT_T DOUBLES(t,COMPONENT)
    #define COMPONENT_M DOUBLES(m,COMPONENT)
    #define COMPONENT_S DOUBLES(s,COMPONENT)
    #define COMPONENT_C DOUBLES(c,COMPONENT)
    #define COMPONENT_F COMPONENT_C
#else
    #define COMPONENT_T COMPONENT
    #define COMPONENT_M COMPONENT
    #define COMPONENT_S COMPONENT
    #define COMPONENT_F COMPONENT
    #define COMPONENT_C COMPONENT
#endif

/* -------------------------------------------
Macro: INC()

Description:
    Increase a number by one.

Parameters:
    VAR - Variable to increment [Number]

Example:
    (begin example)
    _counter = 0;
    INC(_counter);
    // _counter => 1
    (end)

Author:
    Spooner
------------------------------------------- */
#define INC(var) var = (var) + 1

/* -------------------------------------------
Macro: DEC()

Description:
    Decrease a number by one.

Parameters:
    VAR - Variable to decrement [Number]

Example:
    (begin example)
    _counter = 99;
    DEC(_counter);
    // _counter => 98
    (end)

Author:
    Spooner
------------------------------------------- */
#define DEC(var) var = (var) - 1

/* -------------------------------------------
Macro: ADD()

Description:
    Add a value to a variable. Variable and value should be both Numbers or both Strings.

Parameters:
    VAR - Variable to add to [Number or String]
    VALUE - Value to add [Number or String]

Examples:
    (begin example)
        _counter = 2;
        ADD(_counter,3);
        // _counter => 5
    (end)
    (begin example)
        _str = "hello";
        ADD(_str," ");
        ADD(_str,"Fred");
        // _str => "hello Fred"
    (end)

Author:
    Sickboy
------------------------------------------- */
#define ADD(var1,var2) var1 = (var1) + (var2)

/* -------------------------------------------
Macro: SUB()

Description:
    Subtract a value from a number variable. VAR and VALUE should both be Numbers.

Parameters:
    VAR - Variable to subtract from [Number]
    VALUE - Value to subtract [Number]

Examples:
    (begin example)
        _numChickens = 2;
        SUB(_numChickens,3);
        // _numChickens => -1
    (end)
------------------------------------------- */
#define SUB(var1,var2) var1 = (var1) - (var2)

/* -------------------------------------------
Macro: REM()

Description:
    Remove an element from an array each time it occurs.

    This recreates the entire array, so use BIS_fnc_removeIndex if modification of the original array is required
    or if only one of the elements that matches ELEMENT needs to be removed.

Parameters:
    ARRAY - Array to modify [Array]
    ELEMENT - Element to remove [Any]

Examples:
    (begin example)
        _array = [1, 2, 3, 4, 3, 8];
        REM(_array,3);
        // _array = [1, 2, 4, 8];
    (end)

Author:
    Spooner
------------------------------------------- */
#define REM(var1,var2) SUB(var1,[var2])

/* -------------------------------------------
Macro: PUSH()

Description:
    Appends a single value onto the end of an ARRAY. Change is made to the ARRAY itself, not creating a new array.

Parameters:
    ARRAY - Array to push element onto [Array]
    ELEMENT - Element to push [Any]

Examples:
    (begin example)
        _fish = ["blue", "green", "smelly"];
        PUSH(_fish,"monkey-flavoured");
        // _fish => ["blue", "green", "smelly", "monkey-flavoured"]
    (end)

Author:
    Spooner
------------------------------------------- */
#define PUSH(var1,var2) (var1) pushBack (var2)

/* -------------------------------------------
Macro: MAP()
Description:
    Applies given code to each element of the array, then assigns the
    resulting array to the original
Parameters:
    ARRAY - Array to be modified
    CODE - Code that'll be applied to each element of the array.
Example:
    (begin example)
        _array = [1, 2, 3, 4, 3, 8];
        MAP(_array,_x + 1);
        // _array is now [2, 3, 4, 5, 4, 9];
    (end)
Author:
    654wak654
------------------------------------------- */
#define MAP(ARR,CODE) ARR = ARR apply {CODE}

/* -------------------------------------------
Macro: FILTER()
Description:
    Filters an array based on given code, then assigns the resulting array
    to the original
Parameters:
    ARRAY - Array to be filtered
    CODE - Condition to pick elements
Example:
    (begin example)
        _array = [1, 2, 3, 4, 3, 8];
        FILTER(_array,_x % 2 == 0)
        // _array is now [2, 4, 8];
    (end)
Author:
    Commy2
------------------------------------------- */
#define FILTER(ARR,CODE) ARR = ARR select {CODE}

/* -------------------------------------------
Macro: UNIQUE()
Description:
    Removes duplicate values in given array
Parameters:
    ARRAY - The array to be modified
Example:
    (begin example)
        _someArray = [4, 4, 5, 5, 5, 2];
        UNIQUE(_someArray);
        // _someArray is now [4, 5, 2]
    (end)
Author:
    Commy2
------------------------------------------- */
#define UNIQUE(ARR) ARR = ARR arrayIntersect ARR

/* -------------------------------------------
Macro: INTERSECTION()
Description:
    Finds unique common elements between two arrays and assigns them
    to the first array
Parameters:
    ARRAY0 - The array to be modified
    ARRAY1 - The array to find intersections with
Example:
    (begin example)
        _someArray = [1, 2, 3, 4, 5, 5];
        _anotherArray = [4, 5, 6, 7];
        INTERSECTION(_someArray,_anotherArray);
        // _someArray is now [4, 5]
    (end)
Author:
    654wak654
------------------------------------------- */
#define INTERSECTION(ARG0,ARG1) ARG0 = ARG0 arrayIntersect (ARG1)

/* -------------------------------------------
Macro: ISNILS()

Description:
    Sets a variable with a value, but only if it is undefined.

Parameters:
    VARIABLE - Variable to set [Any, not nil]
    DEFAULT_VALUE - Value to set VARIABLE to if it is undefined [Any, not nil]

Examples:
    (begin example)
        // _fish is undefined
        ISNILS(_fish,0);
        // _fish => 0
    (end)
    (begin example)
        _fish = 12;
        // ...later...
        ISNILS(_fish,0);
        // _fish => 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define ISNILS(VARIABLE,DEFAULT_VALUE) if (isNil #VARIABLE) then { VARIABLE = DEFAULT_VALUE }
#define ISNILS2(var1,var2,var3,var4) ISNILS(TRIPLES(var1,var2,var3),var4)
#define ISNILS3(var1,var2,var3) ISNILS(DOUBLES(var1,var2),var3)
#define ISNIL(var1,var2) ISNILS2(PREFIX,COMPONENT,var1,var2)
#define ISNILMAIN(var1,var2) ISNILS3(PREFIX,var1,var2)

#define CREATELOGICS(var1,var2) var1##_##var2 = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"]
#define CREATELOGICLOCALS(var1,var2) var1##_##var2 = "LOGIC" createVehicleLocal [0, 0, 0]
#define CREATELOGICGLOBALS(var1,var2) var1##_##var2 = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"]; publicVariable QUOTE(DOUBLES(var1,var2))
#define CREATELOGICGLOBALTESTS(var1,var2) var1##_##var2 = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit [QUOTE(DOUBLES(ADDON,logic)), [0, 0, 0], [], 0, "NONE"]

#define GETVARS(var1,var2,var3) (var1##_##var2 getVariable #var3)
#define GETVARMAINS(var1,var2) GETVARS(var1,MAINLOGIC,var2)

#ifndef PATHTO_SYS
    #define PATHTO_SYS(var1,var2,var3) \MAINPREFIX\var1\SUBPREFIX\var2\var3.sqf
#endif
#ifndef PATHTOF_SYS
    #define PATHTOF_SYS(var1,var2,var3) \MAINPREFIX\var1\SUBPREFIX\var2\var3
#endif

#ifndef PATHTOF2_SYS
    #define PATHTOF2_SYS(var1,var2,var3) MAINPREFIX\var1\SUBPREFIX\var2\var3
#endif

#define PATHTO_R(var1) PATHTOF2_SYS(PREFIX,COMPONENT_C,var1)
#define PATHTO_T(var1) PATHTOF_SYS(PREFIX,COMPONENT_T,var1)
#define PATHTO_M(var1) PATHTOF_SYS(PREFIX,COMPONENT_M,var1)
#define PATHTO_S(var1) PATHTOF_SYS(PREFIX,COMPONENT_S,var1)
#define PATHTO_C(var1) PATHTOF_SYS(PREFIX,COMPONENT_C,var1)
#define PATHTO_F(var1) PATHTO_SYS(PREFIX,COMPONENT_F,var1)

// Already quoted ""
#define QPATHTO_R(var1) QUOTE(PATHTO_R(var1))
#define QPATHTO_T(var1) QUOTE(PATHTO_T(var1))
#define QPATHTO_M(var1) QUOTE(PATHTO_M(var1))
#define QPATHTO_S(var1) QUOTE(PATHTO_S(var1))
#define QPATHTO_C(var1) QUOTE(PATHTO_C(var1))
#define QPATHTO_F(var1) QUOTE(PATHTO_F(var1))

// This only works for binarized configs after recompiling the pbos
// TODO: Reduce amount of calls / code..
#define COMPILE_FILE2_CFG_SYS(var1) compile preProcessFileLineNumbers var1
#define COMPILE_FILE2_SYS(var1) COMPILE_FILE2_CFG_SYS(var1)

#define COMPILE_FILE_SYS(var1,var2,var3) COMPILE_FILE2_SYS('PATHTO_SYS(var1,var2,var3)')
#define COMPILE_FILE_CFG_SYS(var1,var2,var3) COMPILE_FILE2_CFG_SYS('PATHTO_SYS(var1,var2,var3)')

#define SETVARS(var1,var2) var1##_##var2 setVariable
#define SETVARMAINS(var1) SETVARS(var1,MAINLOGIC)
#define GVARMAINS(var1,var2) var1##_##var2
#define CFGSETTINGSS(var1,var2) configFile >> "CfgSettings" >> #var1 >> #var2
//#define SETGVARS(var1,var2,var3) ##var1##_##var2##_##var3 =
//#define SETGVARMAINS(var1,var2) ##var1##_##var2 =

// Compile-Once, JIT: On first use.
// #define PREPMAIN_SYS(var1,var2,var3) ##var1##_fnc_##var3 = { ##var1##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3)); if (isNil "_this") then { call ##var1##_fnc_##var3 } else { _this call ##var1##_fnc_##var3 } }
// #define PREP_SYS(var1,var2,var3) ##var1##_##var2##_fnc_##var3 = { ##var1##_##var2##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3)); if (isNil "_this") then { call ##var1##_##var2##_fnc_##var3 } else { _this call ##var1##_##var2##_fnc_##var3 } }
// #define PREP_SYS2(var1,var2,var3,var4) ##var1##_##var2##_fnc_##var4 = { ##var1##_##var2##_fnc_##var4 = COMPILE_FILE_SYS(var1,var3,DOUBLES(fnc,var4)); if (isNil "_this") then { call ##var1##_##var2##_fnc_##var4 } else { _this call ##var1##_##var2##_fnc_##var4 } }

// Compile-Once, at Macro. As opposed to Compile-Once, on first use.
#define PREPMAIN_SYS(var1,var2,var3) var1##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3))
#define PREP_SYS(var1,var2,var3) var1##_##var2##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3))
#define PREP_SYS2(var1,var2,var3,var4) var1##_##var2##_fnc_##var4 = COMPILE_FILE_SYS(var1,var3,DOUBLES(fnc,var4))

#define LSTR(var1) TRIPLES(ADDON,STR,var1)

#ifndef DEBUG_SETTINGS
    #define DEBUG_SETTINGS [false, true, false]
#endif

#define MSG_INIT QUOTE(Initializing: ADDON version: VERSION)

// *************************************
// User Functions
#define CFGSETTINGS CFGSETTINGSS(PREFIX,COMPONENT)
#define PATHTO(var1) PATHTO_SYS(PREFIX,COMPONENT_F,var1)
#define PATHTOF(var1) PATHTOF_SYS(PREFIX,COMPONENT,var1)
#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)
#define QPATHTOF(var1) QUOTE(PATHTOF(var1))
#define QPATHTOEF(var1,var2) QUOTE(PATHTOEF(var1,var2))

#define COMPILE_FILE(var1) COMPILE_FILE_SYS(PREFIX,COMPONENT_F,var1)
#define COMPILE_FILE_CFG(var1) COMPILE_FILE_CFG_SYS(PREFIX,COMPONENT_F,var1)
#define COMPILE_FILE2(var1) COMPILE_FILE2_SYS('var1')
#define COMPILE_FILE2_CFG(var1) COMPILE_FILE2_CFG_SYS('var1')


#define VERSIONING_SYS(var1) class CfgSettings \
{ \
    class CBA \
    { \
        class Versioning \
        { \
            class var1 \
            { \
            }; \
        }; \
    }; \
};

#define VERSIONING VERSIONING_SYS(PREFIX)

/* -------------------------------------------
Macro: GVAR()
    Get full variable identifier for a global variable owned by this component.

Parameters:
    VARIABLE - Partial name of global variable owned by this component [Any].

Example:
    (begin example)
        GVAR(frog) = 12;
        // In SPON_FrogDancing component, equivalent to SPON_FrogDancing_frog = 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define GVAR(var1) DOUBLES(ADDON,var1)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQGVAR(var1) QUOTE(QGVAR(var1))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

/* -------------------------------------------
Macro: GVARMAIN()
    Get full variable identifier for a global variable owned by this addon.

Parameters:
    VARIABLE - Partial name of global variable owned by this addon [Any].

Example:
    (begin example)
        GVARMAIN(frog) = 12;
        // In SPON_FrogDancing component, equivalent to SPON_frog = 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define GVARMAIN(var1) GVARMAINS(PREFIX,var1)
#define QGVARMAIN(var1) QUOTE(GVARMAIN(var1))
#define QQGVARMAIN(var1) QUOTE(QGVARMAIN(var1))
// TODO: What's this?
#define SETTINGS DOUBLES(PREFIX,settings)
#define CREATELOGIC CREATELOGICS(PREFIX,COMPONENT)
#define CREATELOGICGLOBAL CREATELOGICGLOBALS(PREFIX,COMPONENT)
#define CREATELOGICGLOBALTEST CREATELOGICGLOBALTESTS(PREFIX,COMPONENT)
#define CREATELOGICLOCAL CREATELOGICLOCALS(PREFIX,COMPONENT)
#define CREATELOGICMAIN CREATELOGICS(PREFIX,MAINLOGIC)
#define GETVAR(var1) GETVARS(PREFIX,COMPONENT,var1)
#define SETVAR SETVARS(PREFIX,COMPONENT)
#define SETVARMAIN SETVARMAINS(PREFIX)
#define IFCOUNT(var1,var2,var3) if (count var1 > var2) then { var3 = var1 select var2 };

//#define PREP(var1) PREP_SYS(PREFIX,COMPONENT_F,var1)

#ifdef DISABLE_COMPILE_CACHE
    #define PREP(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))'
    #define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))'
#else
    #define PREP(var1) ['PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))', 'TRIPLES(ADDON,fnc,var1)'] call SLX_XEH_COMPILE_NEW
    #define PREPMAIN(var1) ['PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))', 'TRIPLES(PREFIX,fnc,var1)'] call SLX_XEH_COMPILE_NEW
#endif

#ifdef RECOMPILE
    #undef RECOMPILE
    #define RECOMPILE recompile = 1
#else
    #define RECOMPILE recompile = 0
#endif

/* -------------------------------------------
Macro: PATHTO_FNC()

Description:
    Defines a function inside CfgFunctions.

    Full file path in addons:
        '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\fnc_<FNC>.sqf'
    Define 'RECOMPILE' to enable recompiling.

Parameters:
    FUNCTION NAME - Name of the function, unquoted <STRING>

Examples:
    (begin example)
        // file name: fnc_addPerFrameHandler.sqf
        class CfgFunctions {
            class CBA {
                class Misc {
                    PATHTO_FNC(addPerFrameHandler);
                };
            };
        };
        // -> CBA_fnc_addPerFrameHandler
    (end)

Author:
    dixon13, commy2
 ------------------------------------------- */
#define PATHTO_FNC(func) class func {\
    file = QPATHTOF(DOUBLES(fnc,func).sqf);\
    RECOMPILE;\
}

#define FUNC(var1) TRIPLES(ADDON,fnc,var1)
#define FUNCMAIN(var1) TRIPLES(PREFIX,fnc,var1)
#define FUNC_INNER(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)
#define EFUNC(var1,var2) FUNC_INNER(var1,var2)
#define QFUNC(var1) QUOTE(FUNC(var1))
#define QFUNCMAIN(var1) QUOTE(FUNCMAIN(var1))
#define QFUNC_INNER(var1,var2) QUOTE(FUNC_INNER(var1,var2))
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))
#define QQFUNC(var1) QUOTE(QFUNC(var1))
#define QQFUNCMAIN(var1) QUOTE(QFUNCMAIN(var1))
#define QQFUNC_INNER(var1,var2) QUOTE(QFUNC_INNER(var1,var2))
#define QQEFUNC(var1,var2) QUOTE(QEFUNC(var1,var2))

#ifndef PRELOAD_ADDONS
    #define PRELOAD_ADDONS class CfgAddons \
{ \
    class PreloadAddons \
    { \
        class ADDON \
        { \
            list[]={ QUOTE(ADDON) }; \
        }; \
    }; \
}
#endif

/* -------------------------------------------
Macros: ARG_#()
    Select from list of array arguments

Parameters:
    VARIABLE(1-8) - elements for the list

Author:
    Rommel
------------------------------------------- */
#define ARG_1(A,B) ((A) select (B))
#define ARG_2(A,B,C) (ARG_1(ARG_1(A,B),C))
#define ARG_3(A,B,C,D) (ARG_1(ARG_2(A,B,C),D))
#define ARG_4(A,B,C,D,E) (ARG_1(ARG_3(A,B,C,D),E))
#define ARG_5(A,B,C,D,E,F) (ARG_1(ARG_4(A,B,C,D,E),F))
#define ARG_6(A,B,C,D,E,F,G) (ARG_1(ARG_5(A,B,C,D,E,F),G))
#define ARG_7(A,B,C,D,E,F,G,H) (ARG_1(ARG_6(A,B,C,D,E,E,F,G),H))
#define ARG_8(A,B,C,D,E,F,G,H,I) (ARG_1(ARG_7(A,B,C,D,E,E,F,G,H),I))

/* -------------------------------------------
Macros: ARR_#()
    Create list from arguments. Useful for working around , in macro parameters.
    1-8 arguments possible.

Parameters:
    VARIABLE(1-8) - elements for the list

Author:
    Nou
------------------------------------------- */
#define ARR_1(ARG1) ARG1
#define ARR_2(ARG1,ARG2) ARG1, ARG2
#define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3
#define ARR_4(ARG1,ARG2,ARG3,ARG4) ARG1, ARG2, ARG3, ARG4
#define ARR_5(ARG1,ARG2,ARG3,ARG4,ARG5) ARG1, ARG2, ARG3, ARG4, ARG5
#define ARR_6(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6
#define ARR_7(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7
#define ARR_8(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8

/* -------------------------------------------
Macros: FORMAT_#(STR, ARG1)
    Format - Useful for working around , in macro parameters.
    1-8 arguments possible.

Parameters:
    STRING - string used by format
    VARIABLE(1-8) - elements for usage in format

Author:
    Nou & Sickboy
------------------------------------------- */
#define FORMAT_1(STR,ARG1) format[STR, ARG1]
#define FORMAT_2(STR,ARG1,ARG2) format[STR, ARG1, ARG2]
#define FORMAT_3(STR,ARG1,ARG2,ARG3) format[STR, ARG1, ARG2, ARG3]
#define FORMAT_4(STR,ARG1,ARG2,ARG3,ARG4) format[STR, ARG1, ARG2, ARG3, ARG4]
#define FORMAT_5(STR,ARG1,ARG2,ARG3,ARG4,ARG5) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5]
#define FORMAT_6(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6]
#define FORMAT_7(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7]
#define FORMAT_8(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8]

// CONTROL(46) 12
#define DISPLAY(A) (findDisplay A)
#define CONTROL(A) DISPLAY(A) displayCtrl

/* -------------------------------------------
Macros: IS_x()
    Checking the data types of variables.

    IS_ARRAY() - Array
    IS_BOOL() - Boolean
    IS_BOOLEAN() - UI display handle(synonym for <IS_BOOL()>)
    IS_CODE() - Code block (i.e a compiled function)
    IS_CONFIG() - Configuration
    IS_CONTROL() - UI control handle.
    IS_DISPLAY() - UI display handle.
    IS_FUNCTION() - A compiled function (synonym for <IS_CODE()>)
    IS_GROUP() - Group.
    IS_INTEGER() - Is a number a whole number?
    IS_LOCATION() - World location.
    IS_NUMBER() - A floating point number (synonym for <IS_SCALAR()>)
    IS_OBJECT() - World object.
    IS_SCALAR() - Floating point number.
    IS_SCRIPT() - A script handle (as returned by execVM and spawn commands).
    IS_SIDE() - Game side.
    IS_STRING() - World object.
    IS_TEXT() - Structured text.

Parameters:
    VARIABLE - Variable to check if it is of a particular type [Any, not nil]

Author:
    Spooner
------------------------------------------- */
#define IS_META_SYS(VAR,TYPE) (if (isNil {VAR}) then {false} else {(VAR) isEqualType TYPE})
#define IS_ARRAY(VAR)    IS_META_SYS(VAR,[])
#define IS_BOOL(VAR)     IS_META_SYS(VAR,false)
#define IS_CODE(VAR)     IS_META_SYS(VAR,{})
#define IS_CONFIG(VAR)   IS_META_SYS(VAR,configNull)
#define IS_CONTROL(VAR)  IS_META_SYS(VAR,controlNull)
#define IS_DISPLAY(VAR)  IS_META_SYS(VAR,displayNull)
#define IS_GROUP(VAR)    IS_META_SYS(VAR,grpNull)
#define IS_OBJECT(VAR)   IS_META_SYS(VAR,objNull)
#define IS_SCALAR(VAR)   IS_META_SYS(VAR,0)
#define IS_SCRIPT(VAR)   IS_META_SYS(VAR,scriptNull)
#define IS_SIDE(VAR)     IS_META_SYS(VAR,west)
#define IS_STRING(VAR)   IS_META_SYS(VAR,"STRING")
#define IS_TEXT(VAR)     IS_META_SYS(VAR,text "")
#define IS_LOCATION(VAR) IS_META_SYS(VAR,locationNull)

#define IS_BOOLEAN(VAR)  IS_BOOL(VAR)
#define IS_FUNCTION(VAR) IS_CODE(VAR)
#define IS_INTEGER(VAR)  (if (IS_SCALAR(VAR)) then {floor (VAR) == (VAR)} else {false})
#define IS_NUMBER(VAR)   IS_SCALAR(VAR)

#define FLOAT_TO_STRING(num)    (if (_this == 0) then {"0"} else {str parseNumber (str (_this % _this) + str floor abs _this) + "." + (str (abs _this - floor abs _this) select [2]) + "0"})

/* -------------------------------------------
Macro: SCRIPT()
    Sets name of script (relies on PREFIX and COMPONENT values being #defined).

Parameters:
    NAME - Name of script [Indentifier]

Example:
    (begin example)
        SCRIPT(eradicateMuppets);
    (end)

Author:
    Spooner
------------------------------------------- */
#define SCRIPT(NAME) \
    scriptName 'PREFIX\COMPONENT\NAME'

/* -------------------------------------------
Macros: EXPLODE_n()
    DEPRECATED - Use param/params commands added in Arma 3 1.48

    Splitting an ARRAY into a number of variables (A, B, C, etc).

    Note that this NOT does make the created variables private.
    _PVT variants do.

    EXPLODE_1(ARRAY,A,B) - Split a 1-element array into separate variable.
    EXPLODE_2(ARRAY,A,B) - Split a 2-element array into separate variables.
    EXPLODE_3(ARRAY,A,B,C) - Split a 3-element array into separate variables.
    EXPLODE_4(ARRAY,A,B,C,D) - Split a 4-element array into separate variables.
    EXPLODE_5(ARRAY,A,B,C,D,E) - Split a 5-element array into separate variables.
    EXPLODE_6(ARRAY,A,B,C,D,E,F) - Split a 6-element array into separate variables.
    EXPLODE_7(ARRAY,A,B,C,D,E,F,G) - Split a 7-element array into separate variables.
    EXPLODE_8(ARRAY,A,B,C,D,E,F,G,H) - Split a 8-element array into separate variables.
    EXPLODE_9(ARRAY,A,B,C,D,E,F,G,H,I) - Split a 9-element array into separate variables.

Parameters:
    ARRAY - Array to read from [Array]
    A..H - Names of variables to set from array [Identifier]

Example:
    (begin example)
        _array = ["fred", 156.8, 120.9];
        EXPLODE_3(_array,_name,_height,_weight);
    (end)

Author:
    Spooner
------------------------------------------- */
#define EXPLODE_1_SYS(ARRAY,A) A = ARRAY param [0]
#define EXPLODE_1(ARRAY,A) EXPLODE_1_SYS(ARRAY,A); TRACE_1("EXPLODE_1, " + QUOTE(ARRAY),A)
#define EXPLODE_1_PVT(ARRAY,A) ARRAY params [#A]; TRACE_1("EXPLODE_1, " + QUOTE(ARRAY),A)

#define EXPLODE_2_SYS(ARRAY,A,B) EXPLODE_1_SYS(ARRAY,A); B = ARRAY param [1]
#define EXPLODE_2(ARRAY,A,B) EXPLODE_2_SYS(ARRAY,A,B); TRACE_2("EXPLODE_2, " + QUOTE(ARRAY),A,B)
#define EXPLODE_2_PVT(ARRAY,A,B) ARRAY params [#A,#B]; TRACE_2("EXPLODE_2, " + QUOTE(ARRAY),A,B)

#define EXPLODE_3_SYS(ARRAY,A,B,C) EXPLODE_2_SYS(ARRAY,A,B); C = ARRAY param [2]
#define EXPLODE_3(ARRAY,A,B,C) EXPLODE_3_SYS(ARRAY,A,B,C); TRACE_3("EXPLODE_3, " + QUOTE(ARRAY),A,B,C)
#define EXPLODE_3_PVT(ARRAY,A,B,C) ARRAY params [#A,#B,#C]; TRACE_3("EXPLODE_3, " + QUOTE(ARRAY),A,B,C)

#define EXPLODE_4_SYS(ARRAY,A,B,C,D) EXPLODE_3_SYS(ARRAY,A,B,C); D = ARRAY param [3]
#define EXPLODE_4(ARRAY,A,B,C,D) EXPLODE_4_SYS(ARRAY,A,B,C,D); TRACE_4("EXPLODE_4, " + QUOTE(ARRAY),A,B,C,D)
#define EXPLODE_4_PVT(ARRAY,A,B,C,D) ARRAY params [#A,#B,#C,#D]; TRACE_4("EXPLODE_4, " + QUOTE(ARRAY),A,B,C,D)

#define EXPLODE_5_SYS(ARRAY,A,B,C,D,E) EXPLODE_4_SYS(ARRAY,A,B,C,D); E = ARRAY param [4]
#define EXPLODE_5(ARRAY,A,B,C,D,E) EXPLODE_5_SYS(ARRAY,A,B,C,D,E); TRACE_5("EXPLODE_5, " + QUOTE(ARRAY),A,B,C,D,E)
#define EXPLODE_5_PVT(ARRAY,A,B,C,D,E) ARRAY params [#A,#B,#C,#D,#E]; TRACE_5("EXPLODE_5, " + QUOTE(ARRAY),A,B,C,D,E)

#define EXPLODE_6_SYS(ARRAY,A,B,C,D,E,F) EXPLODE_5_SYS(ARRAY,A,B,C,D,E); F = ARRAY param [5]
#define EXPLODE_6(ARRAY,A,B,C,D,E,F) EXPLODE_6_SYS(ARRAY,A,B,C,D,E,F); TRACE_6("EXPLODE_6, " + QUOTE(ARRAY),A,B,C,D,E,F)
#define EXPLODE_6_PVT(ARRAY,A,B,C,D,E,F) ARRAY params [#A,#B,#C,#D,#E,#F]; TRACE_6("EXPLODE_6, " + QUOTE(ARRAY),A,B,C,D,E,F)

#define EXPLODE_7_SYS(ARRAY,A,B,C,D,E,F,G) EXPLODE_6_SYS(ARRAY,A,B,C,D,E,F); G = ARRAY param [6]
#define EXPLODE_7(ARRAY,A,B,C,D,E,F,G) EXPLODE_7_SYS(ARRAY,A,B,C,D,E,F,G); TRACE_7("EXPLODE_7, " + QUOTE(ARRAY),A,B,C,D,E,F,G)
#define EXPLODE_7_PVT(ARRAY,A,B,C,D,E,F,G) ARRAY params [#A,#B,#C,#D,#E,#F,#G]; TRACE_7("EXPLODE_7, " + QUOTE(ARRAY),A,B,C,D,E,F,G)

#define EXPLODE_8_SYS(ARRAY,A,B,C,D,E,F,G,H) EXPLODE_7_SYS(ARRAY,A,B,C,D,E,F,G); H = ARRAY param [7]
#define EXPLODE_8(ARRAY,A,B,C,D,E,F,G,H) EXPLODE_8_SYS(ARRAY,A,B,C,D,E,F,G,H); TRACE_8("EXPLODE_8, " + QUOTE(ARRAY),A,B,C,D,E,F,G,H)
#define EXPLODE_8_PVT(ARRAY,A,B,C,D,E,F,G,H) ARRAY params [#A,#B,#C,#D,#E,#F,#G,#H]; TRACE_8("EXPLODE_8, " + QUOTE(ARRAY),A,B,C,D,E,F,G,H)

#define EXPLODE_9_SYS(ARRAY,A,B,C,D,E,F,G,H,I) EXPLODE_8_SYS(ARRAY,A,B,C,D,E,F,G,H); I = ARRAY param [8]
#define EXPLODE_9(ARRAY,A,B,C,D,E,F,G,H,I) EXPLODE_9_SYS(ARRAY,A,B,C,D,E,F,G,H,I); TRACE_9("EXPLODE_9, " + QUOTE(ARRAY),A,B,C,D,E,F,G,H,I)
#define EXPLODE_9_PVT(ARRAY,A,B,C,D,E,F,G,H,I) ARRAY params [#A,#B,#C,#D,#E,#F,#G,#H,#I]; TRACE_9("EXPLODE_9, " + QUOTE(ARRAY),A,B,C,D,E,F,G,H,I)

/* -------------------------------------------
Macro: xSTRING()
    Get full string identifier from a stringtable owned by this component.

Parameters:
    VARIABLE - Partial name of global variable owned by this component [Any].

Example:
    ADDON is CBA_Balls.
    (begin example)
        // Localized String (localize command must still be used with it)
        LSTRING(Example); // STR_CBA_Balls_Example;
        // Config String (note the $)
        CSTRING(Example); // $STR_CBA_Balls_Example;
    (end)

Author:
    Jonpas
------------------------------------------- */
#ifndef STRING_MACROS_GUARD
#define STRING_MACROS_GUARD
    #define LSTRING(var1) QUOTE(TRIPLES(STR,ADDON,var1))
    #define ELSTRING(var1,var2) QUOTE(TRIPLES(STR,DOUBLES(PREFIX,var1),var2))
    #define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))
    #define ECSTRING(var1,var2) QUOTE(TRIPLES($STR,DOUBLES(PREFIX,var1),var2))

    #define LLSTRING(var1) localize QUOTE(TRIPLES(STR,ADDON,var1))
    #define LELSTRING(var1,var2) localize QUOTE(TRIPLES(STR,DOUBLES(PREFIX,var1),var2))
#endif


/* -------------------------------------------
Group: Managing Function Parameters
------------------------------------------- */

/* -------------------------------------------
Macros: PARAMS_n()
    DEPRECATED - Use param/params commands added in Arma 3 1.48

    Setting variables based on parameters passed to a function.

    Each parameter is defines as private and set to the appropriate value from _this.

    PARAMS_1(A) - Get 1 parameter from the _this array (or _this if it's not an array).
    PARAMS_2(A,B) - Get 2 parameters from the _this array.
    PARAMS_3(A,B,C) - Get 3 parameters from the _this array.
    PARAMS_4(A,B,C,D) - Get 4 parameters from the _this array.
    PARAMS_5(A,B,C,D,E) - Get 5 parameters from the _this array.
    PARAMS_6(A,B,C,D,E,F) - Get 6 parameters from the _this array.
    PARAMS_7(A,B,C,D,E,F,G) - Get 7 parameters from the _this array.
    PARAMS_8(A,B,C,D,E,F,G,H) - Get 8 parameters from the _this array.

Parameters:
    A..H - Name of variable to read from _this [Identifier]

Example:
    A function called like this:
    (begin example)
        [_name,_address,_telephone] call recordPersonalDetails;
    (end)
    expects 3 parameters and those variables could be initialised at the start of the function definition with:
    (begin example)
        recordPersonalDetails = {
            PARAMS_3(_name,_address,_telephone);
            // Rest of function follows...
        };
    (end)

Author:
    Spooner
------------------------------------------- */
#define PARAMS_1(A) EXPLODE_1_PVT(_this,A)
#define PARAMS_2(A,B) EXPLODE_2_PVT(_this,A,B)
#define PARAMS_3(A,B,C) EXPLODE_3_PVT(_this,A,B,C)
#define PARAMS_4(A,B,C,D) EXPLODE_4_PVT(_this,A,B,C,D)
#define PARAMS_5(A,B,C,D,E) EXPLODE_5_PVT(_this,A,B,C,D,E)
#define PARAMS_6(A,B,C,D,E,F) EXPLODE_6_PVT(_this,A,B,C,D,E,F)
#define PARAMS_7(A,B,C,D,E,F,G) EXPLODE_7_PVT(_this,A,B,C,D,E,F,G)
#define PARAMS_8(A,B,C,D,E,F,G,H) EXPLODE_8_PVT(_this,A,B,C,D,E,F,G,H)
#define PARAMS_9(A,B,C,D,E,F,G,H,I) EXPLODE_9_PVT(_this,A,B,C,D,E,F,G,H,I)

/* -------------------------------------------
Macro: DEFAULT_PARAM()
    DEPRECATED - Use param/params commands added in Arma 3 1.48

    Getting a default function parameter. This may be used together with <PARAMS_n()> to have a mix of required and
    optional parameters.

Parameters:
    INDEX - Index of parameter in _this [Integer, 0+]
    NAME - Name of the variable to set [Identifier]
    DEF_VALUE - Default value to use in case the array is too short or the value at INDEX is nil [Any]

Example:
    A function called with optional parameters:
    (begin example)
        [_name] call myFunction;
        [_name, _numberOfLegs] call myFunction;
        [_name, _numberOfLegs, _hasAHead] call myFunction;
    (end)
    1 required parameter and 2 optional parameters. Those variables could be initialised at the start of the function
    definition with:
    (begin example)
        myFunction = {
            PARAMS_1(_name);
            DEFAULT_PARAM(1,_numberOfLegs,2);
            DEFAULT_PARAM(2,_hasAHead,true);
            // Rest of function follows...
        };
    (end)

Author:
    Spooner
------------------------------------------- */
#define DEFAULT_PARAM(INDEX,NAME,DEF_VALUE) \
    private [#NAME,"_this"]; \
    ISNILS(_this,[]); \
    NAME = _this param [INDEX, DEF_VALUE]; \
    TRACE_3("DEFAULT_PARAM",INDEX,NAME,DEF_VALUE)

/* -------------------------------------------
Macro: KEY_PARAM()
    Get value from key in _this list, return default when key is not included in list.

Parameters:
    KEY - Key name [String]
    NAME - Name of the variable to set [Identifier]
    DEF_VALUE - Default value to use in case key not found [ANY]

Example:


Author:
    Muzzleflash
------------------------------------------- */
#define KEY_PARAM(KEY,NAME,DEF_VALUE) \
    private #NAME; \
    NAME = [toLower KEY, toUpper KEY, DEF_VALUE, RETNIL(_this)] call CBA_fnc_getArg; \
    TRACE_3("KEY_PARAM",KEY,NAME,DEF_VALUE)

/* -------------------------------------------
Group: Assertions
------------------------------------------- */

#define ASSERTION_ERROR(MESSAGE) ERROR_WITH_TITLE("Assertion failed!",MESSAGE)

/* -------------------------------------------
Macro: ASSERT_TRUE()
    Asserts that a CONDITION is true. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as true [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is false [String]

Example:
    (begin example)
        ASSERT_TRUE(_frogIsDead,"The frog is alive");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_TRUE(CONDITION,MESSAGE) \
    if (not (CONDITION)) then \
    { \
        ASSERTION_ERROR('Assertion (CONDITION) failed!\n\n' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: ASSERT_FALSE()
    Asserts that a CONDITION is false. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as false [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is true [String]

Example:
    (begin example)
        ASSERT_FALSE(_frogIsDead,"The frog died");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_FALSE(CONDITION,MESSAGE) \
    if (CONDITION) then \
    { \
        ASSERTION_ERROR('Assertion (not (CONDITION)) failed!\n\n' + (MESSAGE)) \
    }

/* -------------------------------------------
Macro: ASSERT_OP()
    Asserts that (A OPERATOR B) is true. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display if (A OPERATOR B)  is false. [String]

Example:
    (begin example)
        ASSERT_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_OP(A,OPERATOR,B,MESSAGE) \
    if (not ((A) OPERATOR (B))) then \
    { \
        ASSERTION_ERROR('Assertion (A OPERATOR B) failed!\n' + 'A: ' + (str (A)) + '\n' + 'B: ' + (str (B)) + "\n\n" + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: ASSERT_DEFINED()
    Asserts that a VARIABLE is defined. When an assertion fails, an error is raised with the given MESSAGE..

Parameters:
    VARIABLE - Variable to test if defined [String or Function].
    MESSAGE - Message to display if variable is undefined [String].

Examples:
    (begin example)
        ASSERT_DEFINED("_anUndefinedVar","Too few fish!");
        ASSERT_DEFINED({ obj getVariable "anUndefinedVar" },"Too many fish!");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_DEFINED(VARIABLE,MESSAGE) \
    if (isNil VARIABLE) then \
    { \
        ASSERTION_ERROR('Assertion (VARIABLE is defined) failed!\n\n' + (MESSAGE)); \
    }

/* -------------------------------------------
Group: Unit tests
------------------------------------------- */
#define TEST_SUCCESS(MESSAGE) MESSAGE_WITH_TITLE("Test OK",MESSAGE)
#define TEST_FAIL(MESSAGE) ERROR_WITH_TITLE("Test FAIL",MESSAGE)

/* -------------------------------------------
Macro: TEST_TRUE()
    Tests that a CONDITION is true.
    If the condition is not true, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as true [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is false [String]

Example:
    (begin example)
        TEST_TRUE(_frogIsDead,"The frog is alive");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_TRUE(CONDITION, MESSAGE) \
    if (CONDITION) then \
    { \
        TEST_SUCCESS('(CONDITION)'); \
    } \
    else \
    { \
        TEST_FAIL('(CONDITION) ' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: TEST_FALSE()
    Tests that a CONDITION is false.
    If the condition is not false, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to test as false [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is true [String]

Example:
    (begin example)
        TEST_FALSE(_frogIsDead,"The frog died");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_FALSE(CONDITION, MESSAGE) \
    if (not (CONDITION)) then \
    { \
        TEST_SUCCESS('(not (CONDITION))'); \
    } \
    else \
    { \
        TEST_FAIL('(not (CONDITION)) ' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: TEST_OP()
    Tests that (A OPERATOR B) is true.
    If the test fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display if (A OPERATOR B)  is false. [String]

Example:
    (begin example)
        TEST_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_OP(A,OPERATOR,B,MESSAGE) \
    if ((A) OPERATOR (B)) then \
    { \
        TEST_SUCCESS('(A OPERATOR B)') \
    } \
    else \
    { \
        TEST_FAIL('(A OPERATOR B)') \
    };

/* -------------------------------------------
Macro: TEST_DEFINED_AND_OP()
    Tests that A and B are defined and (A OPERATOR B) is true.
    If the test fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display [String]

Example:
    (begin example)
        TEST_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Killswitch, PabstMirror
------------------------------------------- */
#define TEST_DEFINED_AND_OP(A,OPERATOR,B,MESSAGE) \
    if (isNil #A) then { \
        TEST_FAIL('(A is not defined) ' + (MESSAGE)); \
    } else { \
        if (isNil #B) then { \
            TEST_FAIL('(B is not defined) ' + (MESSAGE)); \
        } else { \
            if ((A) OPERATOR (B)) then { \
                TEST_SUCCESS('(A OPERATOR B) ' + (MESSAGE)) \
            } else { \
                TEST_FAIL('(A OPERATOR B) ' + (MESSAGE)) \
    }; }; };


/* -------------------------------------------
Macro: TEST_DEFINED()
    Tests that a VARIABLE is defined.

Parameters:
    VARIABLE - Variable to test if defined [String or Function].
    MESSAGE - Message to display if variable is undefined [String].

Examples:
    (begin example)
        TEST_DEFINED("_anUndefinedVar","Too few fish!");
        TEST_DEFINED({ obj getVariable "anUndefinedVar" },"Too many fish!");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_DEFINED(VARIABLE,MESSAGE) \
    if (not isNil VARIABLE) then \
    { \
        TEST_SUCCESS('(' + VARIABLE + ' is defined)'); \
    } \
    else \
    { \
        TEST_FAIL('(' + VARIABLE + ' is not defined)' + (MESSAGE)); \
    }

/* -------------------------------------------
Group: Managing Deprecation
------------------------------------------- */

/* -------------------------------------------
Macro: DEPRECATE_SYS()
    Allow deprecation of a function that has been renamed.

    Replaces an old OLD_FUNCTION (which will have PREFIX_ prepended) with a NEW_FUNCTION
    (PREFIX_ prepended) with the intention that the old function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, but runs the new function.

Parameters:
    OLD_FUNCTION - Full name of old function [Identifier for function that does not exist any more]
    NEW_FUNCTION - Full name of new function [Function]

Example:
    (begin example)
        // After renaming CBA_fnc_frog as CBA_fnc_fish
        DEPRECATE_SYS(CBA_fnc_frog,CBA_fnc_fish);
    (end)

Author:
    Sickboy
------------------------------------------- */
#define DEPRECATE_SYS(OLD_FUNCTION,NEW_FUNCTION) \
    OLD_FUNCTION = { \
        WARNING('Deprecated function used: OLD_FUNCTION (new: NEW_FUNCTION) in ADDON'); \
        if (isNil "_this") then { call NEW_FUNCTION } else { _this call NEW_FUNCTION }; \
    }

/* -------------------------------------------
Macro: DEPRECATE()
    Allow deprecation of a function, in the current component, that has been renamed.

    Replaces an OLD_FUNCTION (which will have PREFIX_ prepended) with a NEW_FUNCTION
    (PREFIX_ prepended) with the intention that the old function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, but runs the new function.

Parameters:
    OLD_FUNCTION - Name of old function, assuming PREFIX [Identifier for function that does not exist any more]
    NEW_FUNCTION - Name of new function, assuming PREFIX [Function]

Example:
    (begin example)
        // After renaming CBA_fnc_frog as CBA_fnc_fish
        DEPRECATE(fnc_frog,fnc_fish);
    (end)

Author:
    Sickboy
------------------------------------------- */
#define DEPRECATE(OLD_FUNCTION,NEW_FUNCTION) \
    DEPRECATE_SYS(DOUBLES(PREFIX,OLD_FUNCTION),DOUBLES(PREFIX,NEW_FUNCTION))

/* -------------------------------------------
Macro: OBSOLETE_SYS()
    Replace a function that has become obsolete.

    Replace an obsolete OLD_FUNCTION with a simple COMMAND_FUNCTION, with the intention that anyone
    using the function should replace it with the simple command, since the function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, and runs the command function.

Parameters:
    OLD_FUNCTION - Full name of old function [Identifier for function that does not exist any more]
    COMMAND_CODE - Code to replace the old function [Function]

Example:
    (begin example)
        // In Arma2, currentWeapon command made the CBA_fMyWeapon function obsolete:
        OBSOLETE_SYS(CBA_fMyWeapon,{ currentWeapon player });
    (end)

Author:
    Spooner
------------------------------------------- */
#define OBSOLETE_SYS(OLD_FUNCTION,COMMAND_CODE) \
    OLD_FUNCTION = { \
        WARNING('Obsolete function used: (use: OLD_FUNCTION) in ADDON'); \
        if (isNil "_this") then { call COMMAND_CODE } else { _this call COMMAND_CODE }; \
    }

/* -------------------------------------------
Macro: OBSOLETE()
    Replace a function, in the current component, that has become obsolete.

    Replace an obsolete OLD_FUNCTION (which will have PREFIX_ prepended) with a simple
    COMMAND_CODE, with the intention that anyone using the function should replace it with the simple
    command.

    Shows a warning in RPT each time the deprecated function is used.

Parameters:
    OLD_FUNCTION - Name of old function, assuming PREFIX [Identifier for function that does not exist any more]
    COMMAND_CODE - Code to replace the old function [Function]

Example:
    (begin example)
        // In Arma2, currentWeapon command made the CBA_fMyWeapon function obsolete:
        OBSOLETE(fMyWeapon,{ currentWeapon player });
    (end)

Author:
    Spooner
------------------------------------------- */
#define OBSOLETE(OLD_FUNCTION,COMMAND_CODE) \
    OBSOLETE_SYS(DOUBLES(PREFIX,OLD_FUNCTION),COMMAND_CODE)

#define BWC_CONFIG(NAME) class NAME { \
        units[] = {}; \
        weapons[] = {}; \
        requiredVersion = REQUIRED_VERSION; \
        requiredAddons[] = {}; \
        version = VERSION; \
}

// XEH Specific
#define XEH_CLASS CBA_Extended_EventHandlers
#define XEH_CLASS_BASE DOUBLES(XEH_CLASS,base)
#define XEH_DISABLED class EventHandlers { class XEH_CLASS {}; }; SLX_XEH_DISABLED = 1
#define XEH_ENABLED class EventHandlers { class XEH_CLASS { EXTENDED_EVENTHANDLERS }; }; SLX_XEH_DISABLED = 0

// TODO: These are actually outdated; _Once ?
#define XEH_PRE_INIT QUOTE(call COMPILE_FILE(XEH_PreInit_Once))
#define XEH_PRE_CINIT QUOTE(call COMPILE_FILE(XEH_PreClientInit_Once))
#define XEH_PRE_SINIT QUOTE(call COMPILE_FILE(XEH_PreServerInit_Once))

#define XEH_POST_INIT QUOTE(call COMPILE_FILE(XEH_PostInit_Once))
#define XEH_POST_CINIT QUOTE(call COMPILE_FILE(XEH_PostClientInit_Once))
#define XEH_POST_SINIT QUOTE(call COMPILE_FILE(XEH_PostServerInit_Once))

/* -------------------------------------------
Macro: IS_ADMIN
    Check if the local machine is an admin in the multiplayer environment.

    Reports 'true' for logged and voted in admins.

Parameters:
    None

Example:
    (begin example)
        // print "true" if player is admin
        systemChat str IS_ADMIN;
    (end)

Author:
    commy2
------------------------------------------- */
#define IS_ADMIN_SYS(x) x##kick
#define IS_ADMIN serverCommandAvailable 'IS_ADMIN_SYS(#)'

/* -------------------------------------------
Macro: IS_ADMIN_LOGGED
    Check if the local machine is a logged in admin in the multiplayer environment.

    Reports 'false' if the player was voted to be the admin.

Parameters:
    None

Example:
    (begin example)
        // print "true" if player is admin and entered in the server password
        systemChat str IS_ADMIN_LOGGED;
    (end)

Author:
    commy2
------------------------------------------- */
#define IS_ADMIN_LOGGED_SYS(x) x##shutdown
#define IS_ADMIN_LOGGED serverCommandAvailable 'IS_ADMIN_LOGGED_SYS(#)'

/* -------------------------------------------
Macro: FILE_EXISTS
    Check if a file exists on machines with interface

    Reports "false" if the file does not exist and throws an error in RPT.

Parameters:
    FILE - Path to the file

Example:
    (begin example)
        // print "true" if file exists
        systemChat str FILE_EXISTS("\A3\ui_f\data\igui\cfg\cursors\weapon_ca.paa");
    (end)

Author:
    commy2
------------------------------------------- */
#define FILE_EXISTS(FILE) (call {\
    private _return = false;\
    isNil {\
        private _control = (uiNamespace getVariable ["RscDisplayMain", displayNull]) ctrlCreate ["RscHTML", -1];\
        if (isNull _control) then {\
            _return = loadFile (FILE) != "";\
        } else {\
            _control htmlLoad (FILE);\
            _return = ctrlHTMLLoaded _control;\
            ctrlDelete _control;\
        };\
    };\
    _return\
})
