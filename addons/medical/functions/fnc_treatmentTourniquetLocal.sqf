/*
 * Author: Glowbal
 * Apply a tourniquet to the patient, local callback.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Item used classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_tourniquets", "_part", "_applyingTo"];
params ["_target", "_tourniquetItem", "_selectionName"];

[_target] call FUNC(addToInjuredCollection);

_part = [_selectionName] call FUNC(selectionNameToNumber);

// Place a tourniquet on the bodypart
_tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
_applyingTo = (_tourniquets select _part) + 1 + round(random(100));
_tourniquets set[_part, _applyingTo];
_target setvariable [QGVAR(tourniquets), _tourniquets, true];

[{
    params ["_args", "_idPFH"];
    _args params ["_target", "_applyingTo", "_part", "_time"];

    if (!alive _target) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    _tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
    if !((_tourniquets select _part) == _applyingTo) exitWith {
        // Tourniquet has been removed
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
    if (ACE_time - _time > 120) then {
        _target setvariable [QGVAR(pain), (_target getvariable [QGVAR(pain), 0]) + 0.005];
    };
}, 5, [_target, _applyingTo, _part, ACE_time] ] call CBA_fnc_addPerFrameHandler;

true
