#include "script_component.hpp"
/*
 * Author: Salbei
 * Add or remove a unit to the global Variable.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 * 2: IsRemoveMode <BOOLEAN>
 * 3: RemoveAll <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player, true, false] call ace_trenches_fnc_handleDiggerToGVAR
 *
 * Public: No
 */

params ["_trench", "_unit", "_isRemoveMode", ["_removeAll", false]];

if (_removeAll) exitWith {
    _trench setVariable [QGVAR(diggers), [], true];
};

private _diggingPlayers = _trench getVariable [QGVAR(diggers), []];

if (_isRemoveMode) then {
    _diggingPlayers - [_unit];
} else {
    _diggingPlayers pushBackUnique _unit;
};

_trench setVariable [QGVAR(diggers), _diggingPlayers, true];
