/*
 * Author: esteldunedain
 * Checks if the turret occupied by the given unit has a laser designator
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has designator? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Get the player turret path
private ["_turret","_config","_turretConfig"];
_turret = [_unit] call EFUNC(common,getTurretIndex);
_config = configFile >> "CfgVehicles" >> typeOf vehicle _unit;
_turretConfig = [_config, _turret] call EFUNC(common,getTurretConfigPath);

getNumber (_turretConfig >> QGVAR(Enabled)) > 0
