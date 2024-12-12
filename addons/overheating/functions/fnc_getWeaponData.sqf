#include "..\script_component.hpp"
/*
 * Author: PabstMirror and esteldunedain
 * Get weapon data with caching
 *
 * Arguments:
 * 0: weapon type <STRING>
 *
 * Return Value:
 * 0: dispersion <NUMBER>
 * 1: slowdownFactor <NUMBER>
 * 2: jamChance <NUMBER>
 * 3: modes <ARRAY>
 * 4: muzzle <STRING>
 * 5: reloadTime <NUMBER>
 * 6: closedBolt <NUMBER>
 * 7: barrelMass <NUMBER>
 *
 * Example:
 * ["gun"] call ace_overheating_fnc_getWeaponData
 *
 * Public: No
 */

params ["_weapon"];

// Look in the cache first
private _weaponData = GVAR(cacheWeaponData) get _weapon;
if (!isNil "_weaponData") exitWith {_weaponData};

// Search the config
// The old and new properties have the same name for dispersion, so read whichever is closer to the children
private _property = configFile >> "CfgWeapons" >> _weapon >> QGVAR(dispersion);
private _dispersion = if (isNumber _property) then {
    getNumber _property;
} else {
    if (isArray _property) then {
        // Map old array property to new number property
        ((getArray _property) select 3) / 0.004;
    } else {
        1;
    };
};

// The old and new properties have the same name for slowdownFactor, so read whichever is closer to the children
_property = configFile >> "CfgWeapons" >> _weapon >> QGVAR(slowdownFactor);
private _slowdownFactor = if (isNumber _property) then {
    getNumber _property;
} else {
    if (isArray _property) then {
        // Map old array property to new number property
        ((getArray _property) select 3) / 0.9;
    } else {
        1;
    };
};

// For jam chance, try reading the legacy property first (ace_overheating_jamChance).
private _jamChance = 1 / 3000;
_property = configFile >> "CfgWeapons" >> _weapon >> QGVAR(JamChance);
// If it exists read it, as the weapon is probably third party and not updated to the new properties
if (isArray _property) then {
    // Map old array property to new number property
    _jamChance = (getArray _property) select 1;
} else {
    // No legacy property was found, look for the new one
    _property = configFile >> "CfgWeapons" >> _weapon >> QGVAR(mrbs);
    if (isNumber _property) then {
        _jamChance = 1 / getNumber _property;
    };
};

// for cookoff
private _modes = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
private _muzzle = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles") select 0;
if (_muzzle == "this") then {
    _muzzle = _weapon;
};

private _reloadTime = getNumber (configFile >> "CfgWeapons" >> _weapon >> (_modes select 0) >> "reloadTime");

private _closedBolt = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(closedBolt));

private _barrelMass = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(barrelMass));
if (_barrelMass <= 0) then {
    _barrelMass = METAL_MASS_RATIO * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;
};

// Cache the values
_weaponData = [_dispersion, _slowdownFactor, _jamChance, _modes, _muzzle, _reloadTime, _closedBolt, _barrelMass];
TRACE_2("building cache",_weapon,_weaponData);
GVAR(cacheWeaponData) set [_weapon, _weaponData];

_weaponData
