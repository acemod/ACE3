#include "script_component.hpp"
/*
 * Author: PabstMirror and esteldunedain
 * Get weapon data with caching
 *
 * Arguments:
 * 0: weapon type <STRING>
 *
 * Return Value:
 * 0: dispresion <NUMBER>
 * 1: slowdownFactor <NUMBER>
 * 2: jamChance <NUMBER>
 *
 * Example:
 * ["gun"] call ace_overheating_fnc_getWeaponData
 *
 * Public: No
 */

params ["_weapon"];

// Look in the cache first
private _weaponData = GVAR(cacheWeaponData) getVariable _weapon;
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

// Cache the values
_weaponData = [_dispersion, _slowdownFactor, _jamChance];
TRACE_2("building cache",_weapon,_weaponData);
GVAR(cacheWeaponData) setVariable [_weapon, _weaponData];

_weaponData
