/**
 * fn_debug.sqf
 * @Descr: Print logging messages through the ACE framework.
 * @Author: Glowbal
 *
 * @Arguments: [message ANY, level NUMBER (Optional)]
 * @Return:  BOOL True if message has been printed
 * @PublicAPI: true
 */
#include "script_component.hpp"

#define DEFAULT_LOGGING_LEVEL -1
#define DEFAULT_TEXT_DISPLAY -1

private ["_level", "_prefix", "_defaultLoglevel","_defaultLogDisplayLevel", "_message", "_from"];
PARAMS_1(_msg);
_level = if (count _this > 1) then {_this select 1} else { 2 };

if (typeName _level != "NUMBER") then {
    _level = 2;
};

_defaultLoglevel = if (isNil QGVAR(LOGLEVEL)) then {
    DEFAULT_LOGGING_LEVEL;
} else {
    GVAR(LOGLEVEL);
};

if (_defaultLoglevel < 0) exitwith {
    false
};

_defaultLogDisplayLevel = if (isnil QGVAR(LOGDISPLAY_LEVEL)) then {
    DEFAULT_TEXT_DISPLAY;
} else {
    GVAR(LOGDISPLAY_LEVEL);
};

if (_level <= _defaultLoglevel) then {

    _prefix = switch (_level) do {
        case 0: { "ACE Error" };
        case 1: { "ACE Warn" };
        case 2: { "ACE Debug" };
        case 3: { "ACE Info" };
        default { "ACE Unknown" };
    };
    _message = format["[%1] %2",_prefix,_msg];

    if (_level <= _defaultLogDisplayLevel) then {
        systemChat _message;
    };
    diag_log _message;

    // pass it onwards to the log function:
    // [0, [], compile format["%1",_msg], true] call FUNC(log);
};
true