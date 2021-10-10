#include "script_component.hpp"
/*
 * Author: commy2
 * Report awake animation of unit inside vehicle.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * ReturnValue:
 * The animtaion <STRING>
 *
 * Example:
 * player call ace_common_fnc_getAwakeAnim
 *
 * Public: no
 */

params ["_unit"];

private _vehicle = vehicle _unit;

// --- on foot
if (_vehicle isEqualTo _unit) exitWith {""};

// --- driver
private _config = configOf _vehicle;

if (_unit == driver _vehicle) exitWith {
    getText (configFile >> "CfgMovesBasic" >> "ManActions" >> getText (_config >> "driverAction")) // return
};

// --- turret
private _turret = _unit call CBA_fnc_turretPath;

if (_turret isNotEqualTo []) exitWith {
    private _turretConfig = [_vehicle, _turret] call CBA_fnc_getTurret;

    getText (configFile >> "CfgMovesBasic" >> "ManActions" >> getText (_turretConfig >> "gunnerAction")) // return
};

// --- cargo
private _cargoIndex = _vehicle getCargoIndex _unit;

if (_cargoIndex != -1) exitWith {
    private _cargoAction = getArray (_config >> "cargoAction");
    _cargoIndex = _cargoIndex min (count _cargoAction - 1); // The array can be smaller than the max cargo index, just use last element
    getText (configFile >> "CfgMovesBasic" >> "ManActions" >> (_cargoAction select _cargoIndex)) // return
};

// --- default
""
