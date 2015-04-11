/*
 * Author: KoffeinFlummi, Ruthberg
 * Changes the adjustment for the current scope
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Can we update the zero reference? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

if (cameraView == "GUNNER") exitWith {false};
if !(vehicle _unit == _unit) exitWith {false};
if !(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) exitWith {false};

private ["_unit", "_adjustment", "_elevation"];
_unit = _this select 0;

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0,0,0], [0,0,0], [0,0,0]];
};

_elevation = (_adjustment select _weaponIndex) select 0;

// You can only adjust your zero reference, if your relative elevation setting is not 0
_elevation != 0
