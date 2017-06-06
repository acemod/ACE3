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
 * Example:
 * [bob, 2] call ace_common_fnc_debug
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define DEFAULT_LOGGING_LEVEL -1
#define DEFAULT_TEXT_DISPLAY -1

params ["_msg", ["_level", 2, [0]]];

private _defaultLoglevel = missionNamespace getVariable [QGVAR(LOGLEVEL), DEFAULT_LOGGING_LEVEL];

if (_defaultLoglevel < 0) exitWith {false};

private _defaultLogDisplayLevel = [GVAR(LOGDISPLAY_LEVEL), DEFAULT_TEXT_DISPLAY] select isNil QGVAR(LOGDISPLAY_LEVEL);

if (_level <= _defaultLoglevel) then {
    private _prefix = ["Unknown", "Error", "Warn", "Debug", "Info"] select ([0, 1, 2, 3] find _level + 1);
    private _message = format ["[ACE %1] %2", _prefix, _msg];

    if (_level <= _defaultLogDisplayLevel) then {
        systemChat _message;
    };
    diag_log _message;


};

true
