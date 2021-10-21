#include "script_component.hpp"
/*
 * Author: JoramD
 * Handles percentage chance parachute failure.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call ace_parachute_fnc_handleFailureChance
 *
 * Public: No
 */

params ["_unit", "_vehicle"];

if !(_vehicle isKindOf "ParachuteBase") exitWith {};

if (random 1 < GVAR(failureChance)) then {
    private _failureDelay = getNumber (configOf _vehicle >> QGVAR(failureDelay));
    [FUNC(cutParachute), [_unit, _vehicle], _failureDelay] call CBA_fnc_waitAndExecute;
};
