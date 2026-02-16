#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Update temperature of the round in the chamber and determine if a cookoff should occur.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Barrel Temperature <NUMBER>
 *
 * Return Value:
 * New temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player, 600] call ace_overheating_fnc_updateAmmoTemperature
 *
 * Public: No
 */

params ["_unit", "_weapon", "_barrelTemperature"];
TRACE_3("params",_unit,_weapon,_barrelTemperature);

private _closedBolt = ([_weapon] call FUNC(getWeaponData)) select 6;
private _canUnjam = [_unit] call FUNC(canUnjam);
private _jamType = _unit getVariable [format [QGVAR(%1_jamType), _weapon], "None"];

// Skip if no ammo in chamber
if (
    _unit ammo _weapon < 1
    // closed bolt, and jammed and type not failure to fire
    || {_closedBolt == 1 && {_canUnjam} && {!(_jamType in ["Fire","Dud"])}}
    // open bolt, and not jammed, or jammed and type not failure to fire
    || {_closedBolt == 0 && {!_canUnjam || {_canUnjam && {!(_jamType in ["Fire","Dud"])}}}}
) exitWith {
    private _ambientTemperature = ambientTemperature select 0;
    _unit setVariable [format [QGVAR(%1_ammoTemp), _weapon], _ambientTemperature];
    _ambientTemperature
};

private _ammoTempVarName = format [QGVAR(%1_ammoTemp), _weapon];
private _ammoTemperature = _unit getVariable [_ammoTempVarName, ambientTemperature select 0];

// heat or cool the ammo
if (_ammoTemperature < _barrelTemperature) then {
    // this is functional and feels ok, but someone please do better heat transfer math here, my head hurts.
    private _temperatureDifference = _barrelTemperature - _ammoTemperature;
    _ammoTemperature = _ammoTemperature + (1 max ((_temperatureDifference / 2.75) - 100));
} else {
    _ammoTemperature = _barrelTemperature;
};

// cookoff if too hot
if (_ammoTemperature > (GUNPOWDER_IGNITION_TEMP * GVAR(cookoffCoef))) then {
    [_unit, _weapon, _canUnjam, _jamType] call FUNC(cookoffWeapon);

    // since a cookoff happened then the next round should start at the ambient temperature.
    _ammoTemperature = ambientTemperature select 0;
};

_unit setVariable [_ammoTempVarName, _ammoTemperature];

_ammoTemperature
