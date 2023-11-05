#include "..\script_component.hpp"
/*
 * Author: shukari
 * Returns if vehicle or object is a rearm source.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_rearm_fnc_isSource
 *
 * Public: Yes
 */
params [["_target", objNull, [objNull]]];

if ((_target getVariable [QGVAR(currentSupply), 0]) < 0) exitWith {false};

private _vehCfg = configOf _target;
private _vanillaCargoConfig = getNumber (_vehCfg >> "transportAmmo");
private _rearmCargoConfig = getNumber (_vehCfg >> QGVAR(defaultSupply));
private _supplyVehicle = _target getVariable [QGVAR(isSupplyVehicle), false];

_rearmCargoConfig > 0 || {_supplyVehicle} || {_vanillaCargoConfig > 0}
