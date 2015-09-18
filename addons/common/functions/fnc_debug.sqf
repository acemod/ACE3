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

    _prefix = ["Unknown", "Error", "Warn", "Debug", "Info"] select ([0, 1, 2, 3] find _level + 1);

    _message = format ["[ACE %1] %2", _prefix, _msg];

    if (_level <= _defaultLogDisplayLevel) then {
        systemChat _message;
    };
    diag_log _message;

    // pass it onwards to the log function:
    // [0, [], compile format["%1",_msg], true] call FUNC(log);
};

true
