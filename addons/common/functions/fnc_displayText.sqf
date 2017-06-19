/*
 * Author: commy2
 * Display a message.
 *
 * Arguments:
 * 0: Message <STRING>
 * 1: Play a clicking sound (default: false) <BOOL>
 * 2: How long before hiding the message in seconds (default: 2) <NUMBER>
 * 3: Priority, higher priority messages will override lesser important ones (default: 0) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Message", true, 5, 2] call ace_common_fnc_displayText
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_text", ["_sound", false], ["_delay", 2], ["_priority", 0]];

if (isNil QGVAR(lastHint)) then {
    GVAR(lastHint) = [0, 0];
};

if !(typeName _text in ["STRING", "TEXT"]) then {_text = str _text};

GVAR(lastHint) params ["_lastHintTime", "_lastHintPriority"];

private _time = CBA_missionTime;

if (_time > _lastHintTime + _delay || {_priority >= _lastHintPriority}) then {
    hintSilent _text;
    if (_sound) then {playSound "ACE_Sound_Click"};
    GVAR(lastHint) set [0, _time];
    GVAR(lastHint) set [1, _priority];

    [{if ((_this select 0) == GVAR(lastHint) select 0) then {hintSilent ""};}, [_time], _delay, 0] call CBA_fnc_waitAndExecute;
};
