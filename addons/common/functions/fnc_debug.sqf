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

params ["_msg", ["_level", 2, [0]]];

private ["_defaultLoglevel", "_defaultLogDisplayLevel"];

_defaultLoglevel = [GVAR(LOGLEVEL), DEFAULT_LOGGING_LEVEL] select isNil QGVAR(LOGLEVEL);

if (_defaultLoglevel < 0) exitwith {false};

_defaultLogDisplayLevel = [GVAR(LOGDISPLAY_LEVEL), DEFAULT_TEXT_DISPLAY] select isNil QGVAR(LOGDISPLAY_LEVEL);

if (_level <= _defaultLoglevel) then {
    private ["_prefix", "_message"];

    switch (_level) do {
        case 0: {_prefix = "Error"};
        case 1: {_prefix = "Warn"};
        case 2: {_prefix = "Debug"};
        case 3: {_prefix = "Info"};
        default {_prefix = "Unknown"};
    };

    _message = format ["[ACE %1] %2", _prefix, _msg];

    if (_level <= _defaultLogDisplayLevel) then {
        systemChat _message;
    };
    diag_log _message;

    // pass it onwards to the log function:
    // [0, [], compile format["%1",_msg], true] call FUNC(log);
};

true
