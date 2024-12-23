#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Get the current weapon of the unit.
 * 
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Turret path <ARRAY>
 *
 * Return Value:
 * Current weapon <STRING>
 *
 * Example:
 * [player, vehicle player, [0]] call ace_missile_hud_fnc_getCurrentWeapon
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_turretPath"];
TRACE_3("getCurrentWeapon",_unit,_vehicle,_turretPath);

private _currentWeapon = if (_unit isEqualTo _vehicle) then {
    currentWeapon _unit
} else {
    _vehicle currentWeaponTurret _turretPath
};

_currentWeapon