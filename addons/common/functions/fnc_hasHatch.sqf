#include "script_component.hpp"
/*
 * Author: commy2
 * Check if unit is in a vehicle position where it can turn in or out.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit has a hatch? <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc_hasHatch
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

private _vehicle = vehicle _unit;

if (_unit == _vehicle) exitWith {false};

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

if (getNumber (_config >> "hideProxyInCombat") != 1) exitWith {false};

if (_unit == driver _vehicle) exitWith {
    getNumber (_config >> "forceHideDriver") == 0; // return
};

private _turret = [_unit] call FUNC(getTurretIndex);

if (_turret isEqualTo []) exitWith {false};

private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

getNumber (_turretConfig >> "forceHideGunner") == 0; // return
