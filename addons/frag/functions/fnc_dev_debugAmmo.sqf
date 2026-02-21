#include "..\script_component.hpp"
/*
 * Author: ACE-Team, Lambda.Tiger
 * This function will dump every ammo config that would generate ace_frag
 * fragments that could be fired from a weapon.
 *
 * Arguments:
 * 0: Log ammo types that wouldn't normally frag <BOOL> (default: false)
 * 1: Only print ammo without ACE_frag entries, inherited or otherwise <BOOL> (default: true)
 * 2: Only export ammo classes of classes referenced in CfgMagazines and their
 *    submunitions <BOOL> (default: false)
 * 3: Force a CSV format on debug print. <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_dev_debugAmmo
 *
 * Public: No
 */

params [
    ["_logAll", false, [false]],
    ["_printOnlyIncomplete", true, [true]],
    ["_onlyShotAmmoTypes", false, [false]],
    ["_csvFormat", false, [false]]
];

diag_log text format ["~~~~~~~~~~~~~Start [%1]~~~~~~~~~~~~~", _this];
if (_csvFormat) then {
    diag_log text format ["ammo,gurney_c,gurney_m,gurney_k,gurney_gC,skip,Inheritance"];
};

// Gather all configs, either those that could be created from firing or all classes
private _allAmmoConfigs = createHashMap;
if (_onlyShotAmmoTypes) then {
    private _configSearchFunction = {
        params [
            ["_ammo", "", [""]]
        ];
        if (_ammo isEqualTo "" || {_ammo in _allAmmoConfigs}) exitWith {};
        _allAmmoConfigs set [_ammo, 1];
        private _cfgAmmoRoot = configFile >> "CfgAmmo";
        private _submunitionConfig = _cfgAmmoRoot >> _ammo >> "submunitionAmmo";
        if (isArray _submunitionConfig) then {
            private _subMunition = getArray _submunitionConfig;
            for "_i" from 0 to count _subMunition - 1 do {
                if (_i mod 2 == 0) then {
                    configName (_cfgAmmoRoot >> (_subMunition#_i)) call _configSearchFunction;
                };
            };
        } else {
            private _subMunition = getText _submunitionConfig;
            if (_subMunition isNotEqualTo "") then {
                configName (_cfgAmmoRoot >> _subMunition) call _configSearchFunction;
            };
        };
    };
    private _allMagazineConfigs = "true" configClasses (configFile >> "CfgMagazines");
    private _cfgAmmoCfgPath = configFile >> "CfgAmmo";
    {
        private _magAmmo = getText (_x >> "ammo");
        configName (_cfgAmmoCfgPath >> _magAmmo) call _configSearchFunction;
    } forEach _allMagazineConfigs;
    _allAmmoConfigs = keys _allAmmoConfigs;
} else {
    _allAmmoConfigs = (QUOTE(!(QUOTE(QUOTE(ADDON)) in configName _x)) configClasses (configFile >> "CfgAmmo")) apply {configName _x};
};

private _processedCfgAmmos = 0;
private _printCount = 0;
{ // Begin forEach to check each ammo type
    private _ammo = _x;
    if (_ammo isNotEqualTo "") then {
        INC(_processedCfgAmmos);

        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
        _ammo call FUNC(shouldFrag) params ["_shouldFrag"];

        if (_shouldFrag || _logAll) then {

            private _print = false;
            private _skip = getNumber (_ammoConfig >> QGVAR(skip));
            private _fragTypes = getArray (_ammoConfig >> QGVAR(classes));
            if (_fragTypes isEqualTo []) then {_print = true;};
            private _c = getNumber (_ammoConfig >> QGVAR(charge));
            if (_c == 0) then {_print = true;};
            private _m = getNumber (_ammoConfig >> QGVAR(metal));
            if (_m == 0) then {_print = true;};
            private _k = getNumber (_ammoConfig >> QGVAR(gurney_k));
            if (_k == 0) then {_print = true;};
            private _gC = getNumber (_ammoConfig >> QGVAR(gurney_c));
            if (_gC == 0) then {_print = true;};

            if (!_printOnlyIncomplete || {_print && _skip != 0}) then {
                INC(_printCount);
                if (_csvFormat) then {
                    diag_log text format ["%6,%1,%2,%3,%4,%5,%8,%7", _c, _m, _k, _gC, _skip, _ammo, [_ammoConfig, true] call BIS_fnc_returnParents, _shouldFrag];
                } else {
                    diag_log text format ["Ammo [%1] MISSING frag configs:", _ammo];
                    diag_log text format ["_c=%1,_m=%2,_k=%3,_gC=%4,_skip=%5,_fragTypes=%6", _c, _m, _k, _gC, _skip, _fragTypes];
                };
            };
        };
    };
} forEach _allAmmoConfigs;

diag_log text format ["~~~~~~~~~~~~~~End [%1-%2]~~~~~~~~~~~~~~", count _allAmmoConfigs, _processedCfgAmmos];
diag_log text format ["~~~~~~~~~~~~~~Printed: %1~~~~~~~~~~~", _printCount];
