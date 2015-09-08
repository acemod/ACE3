/*
 * Author: Glowbal
 * Print logging messages through the ACE framework.
 *
 * Arguments:
 * 0: Message <ANY>
 * 1: Level (default: 2) <NUMBER>
 *
 * Return Value:
 * Message is Printed <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define DEFAULT_LOGGING_LEVEL -1
#define DEFAULT_TEXT_DISPLAY -1

private ["_prefix", "_defaultLoglevel","_defaultLogDisplayLevel", "_message"];
params ["_msg", ["_level", 2, [2]]];


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
        case 0: { "Error" };
        case 1: { "Warn" };
        case 2: { "Debug" };
        case 3: { "Info" };
        default { "Unknown" };
    };
    _message = format["[ACE %1] %2",_prefix,_msg];

    if (_level <= _defaultLogDisplayLevel) then {
        systemChat _message;
    };
    diag_log _message;

    // pass it onwards to the log function:
    // [0, [], compile format["%1",_msg], true] call FUNC(log);
};
true
