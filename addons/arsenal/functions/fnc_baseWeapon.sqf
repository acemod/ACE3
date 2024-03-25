#include "..\script_component.hpp"
/*
 * Author: Karel Moricky, johnb43
 * Returns base weapon (weapon without any attachments), but it returns it in config sensitive case.
 * Same as BIS_fnc_baseWeapon, except config case and uses cache.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * Base weapon <STRING>
 *
 * Example:
 * ["arifle_AK12_GL_lush_arco_pointer_F"] call ace_arsenal_fnc_baseWeapon
 *
 * Public: Yes
 */

params [["_weapon", "", [""]]];

// Check if item is cached
(uiNamespace getVariable QGVAR(baseWeaponNameCache)) getOrDefaultCall [toLowerANSI _weapon, {
    private _cfgWeapons = configfile >> "CfgWeapons";
    private _config = _cfgWeapons >> _weapon;

    // If class doesn't exist, exit
    if (!isClass _config) then {
        _weapon
    } else {
        // Get manual base weapon
        private _configBase = _cfgWeapons >> getText (_config >> "baseWeapon");

        if (isClass _configBase) then {
            configName _configBase
        } else {
            private _className = _weapon;

            // Get first parent without any attachments; Only take weapons available to the arsenal
            // https://community.bistudio.com/wiki/Arma_3:_Characters_And_Gear_Encoding_Guide#Character_configuration
            // https://github.com/acemod/ACE3/pull/9040#issuecomment-1597748331
            while {isClass _config && {getNumber (_config >> "scope") > 0 && {if (isNumber (_config >> "scopeArsenal")) then {getNumber (_config >> "scopeArsenal") == 2} else {true}}} && {getNumber (_config >> QGVAR(hide)) != 1}} do {
                if (count (_config >> "LinkedItems") == 0) exitWith {
                    _className = configName _config;
                };

                _config = inheritsFrom _config;
            };

            _className
        };
    };
}, true]
