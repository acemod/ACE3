#include "script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Starts watching the target for sideways correction.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, [turret]] call ace_fcs_fnc_keyDown
 *
 * Public: No
 */

params ["_vehicle", "_turret"];

private _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

// Update display for infantry rangefinders
if (_vehicle == ACE_player) exitWith {[5,5500,25,true] call FUNC(getRange)};

private _distance = [
    getNumber (_turretConfig >> QGVAR(DistanceInterval)),
    getNumber (_turretConfig >> QGVAR(MaxDistance)),
    getNumber (_turretConfig >> QGVAR(MinDistance))
] call FUNC(getRange);

if !(!GVAR(enabled) && FUNC(canUseFCS)) exitWith {};

GVAR(Enabled) = true;
GVAR(time) = CBA_missionTime;


private _weaponDirection = _vehicle weaponDirection (_vehicle currentWeaponTurret _turret);  // @todo doesn't work for sub turrets

if (_turret isEqualTo ([_vehicle] call EFUNC(common,getTurretCommander))) then {
    _weaponDirection = eyeDirection _vehicle;
};

if (_weaponDirection isEqualTo [0,0,0]) then {  // dummy value for non main turrets
    _weaponDirection = [1,0,0];
};

GVAR(Position) = (getPosASL _vehicle) vectorAdd (_weaponDirection vectorMultiply _distance);

[_vehicle,_turret,_distance,0] call FUNC(calculateSolution);
