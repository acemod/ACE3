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
    _ammoTemperature = _ammoTemperature + (1 max ((_temperatureDifference / 2.75) - 100));
} else {
    _ammoTemperature = _barrelTemperature;
};

// check for cook off
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

    // get valid mode and muzzle for the main weapon, we don't want the cookoff to come from an underbarrel launcher
    ([_weapon] call FUNC(getWeaponData)) params ["", "", "", "_modes", "_muzzle", "_reloadTime"];

    // get an appropriate firemode and muzzle, cache the current muzzle
    // trying to match firemodes and switching back to the cached muzzle will hide the change from the player and prevent unexpected mode/muzzle changes (going from full auto to semi auto, or from underbarrel GL to rifle for example)
    private _muzzleCache = currentMuzzle _unit;
    private _mode = currentWeaponMode _unit;
    if !(_mode in _modes) then {
        _mode = _modes select 0;
    };

    // delay cookoff to ensure any previous animation from a fired event is finished
    [
        {
            params ["_unit", "_muzzleCache", "_mode", "_muzzle"];

            // fire the cookoff 
            _unit forceWeaponFire [_muzzle, _mode];

            // switch back to the cached muzzle if required
            if (_muzzle != _muzzleCache) then {
                _unit selectWeapon _muzzleCache;
            };

            [
                [localize LSTRING(WeaponCookedOff)],
                true // allows the hint to be overwritten by another hint, such as a jam or another cookoff
            ] call CBA_fnc_notify;
        },
        [_unit, _muzzleCache, _mode, _muzzle],
        _reloadTime
    ] call CBA_fnc_waitAndExecute;

    // if the cookoff happened then the next round should start at 0
    _ammoTemperature = 0;
};

_unit setVariable [_ammoTempVarName, _ammoTemperature];

_ammoTemperature
