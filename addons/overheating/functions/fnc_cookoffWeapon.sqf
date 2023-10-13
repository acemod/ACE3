#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Cookoff loaded round.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Is Weapon Jammed <BOOL>
 * 3: Type of Jam <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player, true, "Fire"] call ace_overheating_fnc_cookoffWeapon
 *
 * Public: No
 */

params ["_unit", "_weapon", "_canUnjam", "_jamType"];
TRACE_4("params",_unit,_weapon,_canUnjam,_jamType);

// a weapon with a failure to fire or dud type jam will be unjammed from cooking off
// this is first so that the fired event from the cookoff can also cause a jam
if (_canUnjam && {_jamType in ["Fire","Dud"]}) then {
    [_unit, currentMuzzle _unit, true] call FUNC(clearJam);

    // clearJam will remove a dud round, but so will the forced fire, so give back the lost round and shoot it
    if (_jamType isEqualTo "Dud") then {
        _unit setAmmo [_weapon, (_unit ammo _weapon) + 1];
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
        params ["_unit", "_mode", "_muzzle", "_muzzleCache"];

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
    [_unit, _mode, _muzzle, _muzzleCache],
    _reloadTime
] call CBA_fnc_waitAndExecute;
