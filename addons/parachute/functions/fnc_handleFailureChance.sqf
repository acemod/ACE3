#include "script_component.hpp"
/*
 * Author: JoramD
 * Handles percentage chance parachute failure.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call FUNC(handleFailureChance);
 *
 * Public: No
 */

params ["_unit", "_vehicle"];

if !(_vehicle isKindOf "ParachuteBase" || {GVAR(failureChance) > 0}) exitWith {};

if (random 1 < GVAR(failureChance)) then {
    private _failureDelay = getNumber (configFile >> "CfgVehicles" >> str typeOf _vehicle >> QGVAR(failureDelay))
    [{[(_this select 0), (_this select 1)] call FUNC(cutParachute)}, [_unit, _vehicle], _failureDelay] call cba_fnc_waitAndExecute;
};
