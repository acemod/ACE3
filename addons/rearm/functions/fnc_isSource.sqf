#include "script_component.hpp"
/*
 * Author: shukari
 * Returns if vehicle or object is a rearm source.
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: check for vanilla rearm vehicle <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_rearm_fnc_isSource
 *
 * Public: Yes
 */
params [
        ["_target", objNull, [objNull]],
        ["_testVanillaRearm", false, [false]]
    ];

if ((_target getVariable [QGVAR(currentSupply), 0]) < 0) exitWith {false};
    
private _vehCfg = configFile >> "CfgVehicles" >> typeOf _target;
private _vanillaCargoConfig = getNumber (_vehCfg >> "transportAmmo");
private _rearmCargoConfig = getNumber (_vehCfg >> QGVAR(defaultSupply));
private _supplyVehicle = _target getVariable [QGVAR(isSupplyVehicle), false];

_rearmCargoConfig > 0 || {_supplyVehicle} || {_testVanillaRearm && _vanillaCargoConfig > 0}
