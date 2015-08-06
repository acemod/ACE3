/*
 * Author: commy2
 *
 * Display a message.
 *
 * Argument:
 * 0: Message (String)
 * 1: Play a clicking sound (Bool, optional default: false)
 * 2: How long before hiding the message in seconds (Number, optional default: 2 sec)
 * 3: Priority, higher priority messages will override lesser important ones (Number, optional default: 0)
 *
 * Return value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"



private ["_lastHintTime", "_lastHintPriority", "_time"];

params ["_text", ["_sound", false], ["_delay", 2], ["_priority", 0]];

if (isNil QGVAR(lastHint)) then {
    GVAR(lastHint) = [0, 0];
};

GVAR(lastHint) params ["_lastHintTime","_lastHintPriority"];

if !(typeName _text in ["STRING", "TEXT"]) then {_text = str _text};

_time = ACE_time;
if (_time > _lastHintTime + _delay || {_priority >= _lastHintPriority}) then {
    hintSilent _text;
    if (_sound) then {playSound "ACE_Sound_Click"};
    GVAR(lastHint) set [0, _time];
    GVAR(lastHint) set [1, _priority];

    [{if (_this == GVAR(lastHint) select 0) then {hintSilent ""};}, _time, _delay, 0] call FUNC(waitAndExecute);
};
