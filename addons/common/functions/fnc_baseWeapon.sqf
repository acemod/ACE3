#include "script_component.hpp"
/*
 * Author: Karel Moricky, johnb43
 * Returns base weapon (weapon without any attachments), but it returns it in config sensitive case.
 * Same as BIS_fnc_baseWeapon, except config case and uses cache.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["arifle_AK12_GL_lush_arco_pointer_F"] call ace_common_fnc_baseWeapon
 *
 * Public: Yes
 */

params [["_weapon", "", [""]]];

private _cacheKey = toLower _weapon;

// Check if item is cached
private _className = (uiNamespace getVariable QGVAR(baseWeaponNameCache)) get _cacheKey;

if (!isNil "_className") exitWith {
    _className
};

private _config = configfile >> "CfgWeapons" >> _weapon;

// If class doesn't exist, exit
if (!isClass _config) exitWith {
    (uiNamespace getVariable QGVAR(baseWeaponNameCache)) set [_cacheKey, _weapon];
    _weapon
};

// Get manual base weapon
private _configBase = configfile >> "CfgWeapons" >> getText (_config >> "baseWeapon");

if (isClass _configBase) exitWith {
    _className = configName _configBase;
    (uiNamespace getVariable QGVAR(baseWeaponNameCache)) set [_cacheKey, _className];
    _className
};

// Get first parent without any attachments
scopeName "main";

// Only take weapons available to the arsenal
while {isClass _config && {getNumber (_config >> "scope") == 2}} do {
    if (count (_config >> "LinkedItems") == 0) exitWith {
        _className = configName _config;
        (uiNamespace getVariable QGVAR(baseWeaponNameCache)) set [_cacheKey, _className];
        _className breakOut "main"
    };

    _config = inheritsFrom _config;
};

_cache set [_cacheKey, _weapon];
_weapon
