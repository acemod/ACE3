/*
 * Author: esteldunedain
 * Checks if the turret occupied by the given unit has a laser designator
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Has designator? <BOOL>
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_unit);

// Get the player turret path
private ["_turret","_config","_turretConfig"];
_turret = [_unit] call EFUNC(common,getTurretIndex);
_config = configFile >> "CfgVehicles" >> typeOf vehicle _unit;
_turretConfig = [_config, _turret] call EFUNC(common,getTurretConfigPath);

getNumber (_turretConfig >> QGVAR(Enabled)) > 0
