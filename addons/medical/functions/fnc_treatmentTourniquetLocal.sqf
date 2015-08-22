/*
 * Author: Glowbal
 * Apply a tourniquet to the patient, local callback.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Item used classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_target", "_tourniquetItem", "_part", "_tourniquets", "_applyingTo", "_selectionName"];
_target = _this select 0;
_tourniquetItem = _this select 1;
_selectionName = _this select 2;

[_target] call FUNC(addToInjuredCollection);

_part = [_selectionName] call FUNC(selectionNameToNumber);

// Place a tourniquet on the bodypart
_tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
_applyingTo = (_tourniquets select _part) + 1 + round(random(100));
_tourniquets set[_part, _applyingTo];
_target setvariable [QGVAR(tourniquets), _tourniquets, true];

[{
    private ["_args","_target","_applyingTo","_part", "_tourniquets", "_time"];
    _args = _this select 0;
    _target = _args select 0;
    _applyingTo = _args select 1;
    _part = _args select 2;
    _time = _args select 3;
    if (!alive _target) exitwith {
        [(_this select 1)] call CBA_fnc_removePerFrameHandler;
    };

    _tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
    if !((_tourniquets select _part) == _applyingTo) exitwith {
        // Tourniquet has been removed
        [(_this select 1)] call CBA_fnc_removePerFrameHandler;
    };
    if (ACE_time - _time > 120) then {
        _target setvariable [QGVAR(pain), (_target getvariable [QGVAR(pain), 0]) + 0.005];
    };
}, 5, [_target, _applyingTo, _part, ACE_time] ] call CBA_fnc_addPerFrameHandler;

true;
