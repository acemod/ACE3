/*
 * Author: KoffeinFlummi, Ruthberg
 * Checks if the unit can reset the zero adjustment of the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can we reset the zero reference? <BOOL>
 *
 * Example:
 * [player] call ace_scopes_fnc_canResetZero
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (cameraView == "GUNNER") exitWith {false};
if (vehicle _unit != _unit) exitWith {false};
if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {false};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zero = (_adjustment select _weaponIndex) select 2;

// You can only reset your zero reference, if it is not 0 already
_zero != 0
