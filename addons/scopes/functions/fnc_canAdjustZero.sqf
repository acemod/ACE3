#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, Ruthberg
 * Checks if the unit can change the zero adjustment of the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can we update the zero reference? <BOOL>
 *
 * Example:
 * [player] call ace_scopes_fnc_canAdjustZero
 *
 * Public: No
 */

params ["_unit"];

if (cameraView == "GUNNER") exitWith {false};
if (vehicle _unit != _unit) exitWith {false};
if (GVAR(simplifiedZeroing)) exitWith {false};
if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {false};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _elevation = (_adjustment select _weaponIndex) select 0;

// You can only adjust your zero reference, if your relative elevation setting is not 0
_elevation != 0
