#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger, based on fnc_dev_debugAmmo by "ACE-Team"
 * Dumps all ammo types to see if there's any reason to spawn fragments
 * given hit power and distance. Good for grasping the values used in
 * shouldFrag to cull non-fragmenting rounds
 *
 * Arguments:
 * 0: Display rounds that will never frag (power < 5).
 *           Default value false <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, 10] call ace_frag_fnc_fragoCalcDump
 *
 * Public: No
 */

params [
    ["_logAll", false, [false]]
];


private _allAmmoConfigs = configProperties [configFile >> "cfgAmmo", "isClass _x && !('ace_frag' in configName _x)", true];
private _processedCfgAmmos = [];

private _nPrinted = 0;

diag_log text "//****************** fragCalcDump Beg ******************//";
{ // Begin _allAmmoConfigs forEach
    private _ammo = toLowerANSI configName _x;

    if (_ammo == "" || {_ammo in _processedCfgAmmos} ) then {
        continue
    };


    private _shouldFrag = [_ammo] call FUNC(shouldFrag);
    if (_nSkip || _logAll) then {
        private _fragInfo = [_ammo] call FUNC(getFragInfo);
        _fragInfo params ["_fragRange", "_fragMaxVelocity", "", "_modifiedFragCount"];
        private _fragCount = 4 * pi* _modifiedFragCount;
        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
        private _indirectHitRange = getNumber (_ammoConfig >> "indirectHitRange");
        private _indirectHit = getNumber (_ammoConfig >> "indirectHit");
        private _fragPowerSpeedRange = [0.5, 1] vectorMultiply _fragMaxVelocity;

        diag_log text format ["Ammo type: %1 | Should frag: %2", _ammo, _shouldFrag];
        diag_log text format ["    Indirect hit range: %1", _indirectHitRange];
        diag_log text format ["    Indirect hit:       %1", _indirectHit];
        diag_log text format ["    Frag sqrtPower:     %1", _fragPowerSqrt];
        diag_log text format ["    Frag range:         %1", _fragRange];
        diag_log text format ["    Frag speed range:   %1", _fragPowerSpeedRange];
        diag_log text format ["    Number frags:       %1", _fragCount];
        INC(_nPrinted);
    };

    _processedCfgAmmos pushBack _ammo;
} forEach _allAmmoConfigs;

diag_log text "//****************** fragCalcDump End ******************//";
diag_log text format ["//********************** printed %1 *********************//", _nPrinted];