#include "script_component.hpp"
/*
 * Author: drofseh
 * Update temperature of the round in the chamber and determine if a cookoff should occur.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Barrel Temperature <STRING>
 *
 * Return Value:
 * Current ammunition temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player, 600] call ace_overheating_fnc_updateAmmoTemperature
 *
 * Public: No
 */

params ["_unit", "_weapon", "_barrelTemperature"];
TRACE_3("params",_unit,_weapon,_barrelTemperature);

private _closedBolt = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(closedBolt));
private _canUnjam = [_unit] call FUNC(canUnjam);

// Skip if no ammo in chamber
if (
    _unit ammo _weapon < 1
    // closed bolt, and jammed and type not failure to fire
    || {_closedBolt == 1 && {_canUnjam} && {!(_unit getVariable [format [QGVAR(%1_jamType), _weapon], "None"] in ["Fire","Dud"])}}
    // open bolt, and not jammed, or jammed and type not failure to fire
    || {_closedBolt == 0 && {!_canUnjam || {_canUnjam && {!(_unit getVariable [format [QGVAR(%1_jamType), _weapon], "None"] in ["Fire","Dud"])}}}}
) exitWith {
    _unit setVariable [format [QGVAR(%1_ammoTemp), _weapon], 0];
    0
};

private _ammoTempVarName = format [QGVAR(%1_ammoTemp), _weapon];
private _ammoTemperature = _unit getVariable [_ammoTempVarName, 0];

// heat or cool the ammo
if (_ammoTemperature < _barrelTemperature) then {
    // this is functional and feels ok, but someone please do better heat transfer math here, my head hurts.
    private _temperatureDifference = _barrelTemperature - _ammoTemperature;
    _ammoTemperature = _ammoTemperature + (1 max (_temperatureDifference / 3.5 - 40));
} else {
    _ammoTemperature = _barrelTemperature;
};

// cook off and reset temp for next round
if (_ammoTemperature > (GUNPOWDER_IGNITION_TEMP * GVAR(cookoffCoef))) then {

    // a weapon with a failure to fire or dud type jam will be unjammed from cooking off
    // this is first so that the fired event from the cookoff can also cause a jam
    private _jamType = _unit getVariable [format [QGVAR(%1_jamType), _weapon], "None"];
    if (_canUnjam && {_jamType in ["Fire","Dud"]}) then {

        [_unit, currentMuzzle _unit, true] call FUNC(clearJam);

        // clearJam will remove a dud round, but so will the forced fire, so give back the lost round and shoot it
        if (_jamType isEqualTo "Dud") then {
            private _ammo = _unit ammo _weapon;
            _unit setAmmo [_weapon, _ammo + 1];
        };
    };

    // delay cookoff to ensure any previous animation from a firing event is finished
    [
        {
            params ["_unit", "_weapon"];
            _unit forceWeaponFire [_weapon, currentWeaponMode _unit];
        },
        [_unit, _weapon],
        getNumber (configfile >> "CfgWeapons" >> _weapon >> _mode >> "reloadTime")
    ] call CBA_fnc_waitAndExecute;

    _ammoTemperature = 0;
};

_unit setVariable [_ammoTempVarName, _ammoTemperature];

_ammoTemperature
