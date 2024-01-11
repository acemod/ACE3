#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger, based on fnc_dev_debugAmmo by "ACE-Team"
 * Dumps all ammo types to see if there's any reason to spawn fragments
 * given power, distance, and lifetime of each fragement
 *
 * Arguments:
 * 0: _dispAll <BOOL> - Display rounds that will never frag (power < 5).
 *           Default value false
 * 1: _minFrgPowRng <FLOAT> - minimum range for sqrt power calculation 
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, 10] call ace_frag_fnc_fragoCalcDump
 *
 * Public: No
 */

params [["_dispAll", false, [false]], ["_minFrgPowRng", 35, [123]]];

#define DT 0.01

private _allMagsConfigs = configProperties [configFile >> "cfgAmmo", "isClass _x && !('ace' in configName _x)", true];
private _processedCfgAmmos = [];



private _nPrinted = 0;

diag_log text "//****************** fragCalcDump Beg ******************//";
// Processing ammo types
{
    private _ammo = toLower configName _x;
    
    if (_ammo == "" || {_ammo in _processedCfgAmmos} ) then {continue};


    // calculating hit range

    private _skip = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(skip));
    private _force = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(force));
    private _explosive = getNumber (configFile >> "cfgAmmo" >> _ammo >> "explosive");
    private _indirectHit = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHit");
    private _indirectRange = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHitRange");
    
    _shouldFrag = if (_skip == 1  || (_force == 0 && {_explosive < 0.5 || {_indirectHit < 3 
        || {_indirectRange < 5 && _indirectHit < _indirectRange}}})) then {
        false;
    } else {
        true;
    };
    
    // Gunery equation from frago
    private _c = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(CHARGE));
    if (_c == 0) then {_c = 1;};
    private _m = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(METAL));
    if (_m == 0) then {_m = 2;};
    private _k = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(GURNEY_K));
    if (_k == 0) then {_k = 0.8;};
    private _gC = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(GURNEY_C));
    if (_gC == 0) then {_gC = 2440;};
    private _fragCount = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(fragCount));
    if (_fragCount == 0) then {_fragCount = 200; _warn = true};
    
    private _velocity = 0.8 * _gC * sqrt (_c /(_m + _c * _k));
    // number of shrapnel to send a direction
    private _count = ceil (random (sqrt (_m / 1000)));
    private _fragPowerSpeedRange = [0.5, 1] vectorMultiply _fragPower;

    if (_nSkip || _dispALl) then
    {
        diag_log text format ["Ammo type: %1", _ammo];
        diag_log text format ["    Indirect hit range: %1", _indirectHitRange];
        diag_log text format ["    Frag sqrtPower:     %1", _fragPowerSqrt];
        diag_log text format ["    Frag range:         %1", _fragRange];
        diag_log text format ["    Frag speed range:   %1", _fragPowerSpeedRange];
        diag_log text format ["    Number frags:       %1", _count];
        diag_log text "   ~~~ Fragments ~~~";
        
        
        INC(_nPrinted);
    };
    
    _processedCfgAmmos pushBack _ammo;
} forEach _allMagsConfigs;

diag_log text          "//****************** fragCalcDump End ******************//";
diag_log text format ["//********************** printed %1 *********************//", _nPrinted];