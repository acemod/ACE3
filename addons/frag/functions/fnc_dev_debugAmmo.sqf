#define DEBUG_MODE_FULL
#include "..\script_component.hpp"
/*
 * Author: ACE-Team, Lambda.Tiger
 * This function will dump every ammo config that would generate ace_frag
 * fragments that could be fired from a weapon
 *
 * Arguments:
 * 0: Log ammo types that wouldn't normally frag
 * 1: Only export ammo classes of classes referenced in cfgMagazines
 *    and their submunitions. <BOOL>
 * 2: Force a CSV format on debug print <BOOL>
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
    ["_onlyShotAmmoTypes", false, [false]],
    ["_csvFormat", false, [false]]
];

diag_log text format ["~~~~~~~~~~~~~Start [%1]~~~~~~~~~~~~~", _this];
if (_csvFormat) then {
    diag_log text format ["ammo,gurney_c,gurney_m,gurney_k,gurney_gC,fragTypes,fragCount,Inheritance"];
};

// Gather all configs, either those that could be created from firing or all classes
private _allAmmoConfigs = [];
if (_onlyShotAmmoTypes) then {
    private _configSearchFunc = {
        params [
            ["_ammo", "", [""]]
        ];
        if (_ammo isEqualTo "" || {_ammo in _allAmmoConfigs}) exitWith {};
        _allAmmoConfigs pushBack _ammo;
        private _subMunit = toLowerANSI getText (configFile >> "cfgAmmo" >> _ammo >> "submunitionAmmo");
        if (_subMunit isNotEqualTo "") then {
            _subMunit = getArray (configFile >> "cfgAmmo" >> _ammo >> "submunitionAmmo");
            for "_i" from 0 to count _subMunit - 1 do {
                if (_i mod 2 == 0) then {
                    [toLowerANSI (_subMunit#_i)] call _configSearchFunc;
                };
            };
        } else {
            [toLowerANSI _subMunit] call _configSearchFunc;
        };
    };
    private _allMagazineConfigs = configProperties [configFile >> "cfgMagazines", "isClass _x", true];

    {
        [toLowerANSI getText (_x >> "ammo")] call _configSearchFunc;
    } forEach _allMagazineConfigs;
} else {
    _allAmmoConfigs = configProperties [configFile >> "cfgAmmo", "isClass _x && !('ace_frag' in configName _x)", true] apply {configName _x};
};

private _processedCfgAmmos = [];
private _printCount = 0;
{ // Begin forEach to check each ammo type
    private _ammo = _x;
    if (_ammo != "" && {!(_ammo in _processedCfgAmmos)}) then {
        _processedCfgAmmos pushBack _ammo;

        private _ammoConfig = (configFile >> "cfgAmmo" >> _ammo);
        private _shoulFrag = [_ammo] call FUNC(shouldFrag);

        if (_shoulFrag || _logAll) then {

            private _warn = false;
            private _fragTypes = getArray (_ammoConfig >> QGVAR(CLASSES));
            if (_fragTypes isEqualTo []) then {_warn = true;};
            private _c = getNumber(_ammoConfig >> QGVAR(CHARGE));
            if (_c == 0) then {_warn = true;};
            private _m = getNumber(_ammoConfig >> QGVAR(METAL));
            if (_m == 0) then {_warn = true;};
            private _k = getNumber(_ammoConfig >> QGVAR(GURNEY_K));
            if (_k == 0) then {_warn = true;};
            private _gC = getNumber(_ammoConfig >> QGVAR(GURNEY_C));
            if (_gC == 0) then {_warn = true;};
            private _fragCount = getNumber (_ammoConfig >> QGVAR(fragCount));
            if (_fragCount == 0) then {_fragCount = 200; _warn = true;};

            if (_warn) then {
                INC(_printCount);
                if (_csvFormat) then {
                    diag_log text format ["%7,%1,%2,%3,%4,%5,%6,%8", _c, _m, _k, _gC, _fragTypes, _fragCount, _ammo, [_ammoConfig, true] call BIS_fnc_returnParents];
                } else {
                    diag_log text format ["Ammo [%1] MISSING frag configs:", _ammo];
                    diag_log text format [" _c=%1,_m=%2,_k=%3,_gC=%4,_fragTypes=%5,_fragCount=%6", _c, _m, _k, _gC, _fragTypes, _fragCount];
                };
            };
        };
    };
} forEach _allAmmoConfigs;

diag_log text format ["~~~~~~~~~~~~~~End [%1-%2]~~~~~~~~~~~~~~", count _allAmmoConfigs, count _processedCfgAmmos];
diag_log text format ["~~~~~~~~~~~~~~Printed: %1~~~~~~~~~~~", _printCount];
