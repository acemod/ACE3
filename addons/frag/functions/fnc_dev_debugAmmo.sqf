#define DEBUG_MODE_FULL
#include "..\script_component.hpp"
/*
 * Author: ACE-Team, Lambda.Tiger
 * This function will dump every ammo config that would generate ace_frag 
 * fragements that doesn't have 
 *
 * Arguments:
 * 0: Log ammo types that wouldn't normall frag
 * 1: Force a CSV format
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_frag_fnc_dev_debugAmmo
 *
 * Public: No
 */

params [
    ["_debugForce", false, [false]],
    ["_csvFormat", false, [false]]
];

diag_log text format ["~~~~~~~~~~~~~Start [%1]~~~~~~~~~~~~~", _this];

private _allAmmoConfigs = configProperties [configFile >> "cfgAmmo", "isClass _x && !('ace_frag' in configName _x)", true];
private _processedCfgAmmos = [];

if (_csvFormat) then {
    diag_log text format ["ammo,gurney_c,gurney_m,gurney_k,gurney_gC,_fragTypes,_fragCount"];
};

private _printCount = 0;

{
    private _ammo = tolower configName _x;
    if (_ammo != "" && {!(_ammo in _processedCfgAmmos)}) then {
        _processedCfgAmmos pushBack _ammo;

        //Ignore mines/bombs
        //if (_ammo isKindOf "TimeBombCore") exitWith {};

        private _ammoConfig = _x;
        private _shoulFrag = [_ammo] call FUNC(shouldFrag);

        if (_shoulFrag || _debugForce) then {

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
                    diag_log text format ["%7,%1,%2,%3,%4,%5,%6", _c, _m, _k, _gC, _fragTypes, _fragCount, _ammo];
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
