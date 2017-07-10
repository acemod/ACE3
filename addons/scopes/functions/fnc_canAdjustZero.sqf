/*
 * Author: KoffeinFlummi, Ruthberg
 * Changes the adjustment for the current scope
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
#include "script_component.hpp"

private ["_weaponIndex", "_adjustment", "_elevation"];

params ["_unit"];

if (cameraView == "GUNNER") exitWith {false};
if (vehicle _unit != _unit) exitWith {false};
if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {false};

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

_adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
_elevation = (_adjustment select _weaponIndex) select 0;

// You can only adjust your zero reference, if your relative elevation setting is not 0
_elevation != 0
