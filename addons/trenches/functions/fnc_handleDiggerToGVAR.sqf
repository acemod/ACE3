#include "script_component.hpp"
/*
 * Author: Salbei
 * Add or remove a unit to the GVAR
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 * 2: State <BOOLEAN>
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

params ["_trench", "_unit", "_state", ["_removeAll", false]];

if (_removeAll) exitWith {
    _trench setVariable [QGVAR(diggingPlayers), [], true];
};

if (_state) then {
    private _diggingPlayers = _trench getVariable [QGVAR(diggingPlayers), []];
    private _return = _diggingPlayers pushBackUnique _unit;
    if (_return > -1) then {
        _trench setVariable [QGVAR(diggingPlayers), _diggingPlayers, true];
    };
} else {
    private _diggingPlayers = _trench getVariable [QGVAR(diggingPlayers), []];
    _diggingPlayers - [_unit];
    _trench setVariable [QGVAR(diggingPlayers), _diggingPlayers, true];
};
