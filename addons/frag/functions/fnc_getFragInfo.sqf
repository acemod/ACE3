#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function returns fragmentation parameters for a specific
 * ammo type.
 * 
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
 * 
 * Return Value:
 * _ammoInfo <ARRAY>
 *  0: _fragRange - search range for fragments
 *  1: _fragVel - gurney equation calculated velocity
 *  2: _fragTypes - array of fragment types
 *  3: _fragCount - modified frag count used under assumptions 
 *                                   of spherical fragmentation
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_getFragInfo;
 *
 * Public: No
 */

params ["_ammo"];

private _ammoInfo = GVAR(fragInfoCache) get _ammo;

if !(isNil "_ammoInfo") exitWith {_ammoInfo};

private _fragTypes = [];
private _warn = false;
if (isArray (configFile >> "cfgAmmo" >> _ammo >> QGVAR(CLASSES))) then {
    _fragTypes  = getArray (configFile >> "cfgAmmo" >> _ammo >> QGVAR(CLASSES));
} else {
    _warn = true;
};

/************ Gurney equation notes *****************//*
 * see https://en.wikipedia.org/wiki/Gurney_equations
 * 
 * GURNEY_K is the constant added to _m/_c
 * GURNEY_C = sqrt(2E)
 *
 * _c = 185; - grams of comp-b
 * _m = 210; - grams of fragmentating metal
 * _k = 3/5; - spherical K factor
 * _gC = 2843; - Gurney constant of comp-b in /ms
 *
 * _c = 429; - grams of tritonal
 * _m = 496; - grams of fragmentating metal
 * _k = 1/2; - cylindrical K factor
 * _gC = 2320; - Gurney constant of tritonal in m/s
 * Equation - 0.8 for empirical 80% speed
 * 0.8 * (((_m / _c) + _k) ^ - (1 / 2)) * _gC;
 * or 0.8 * _gC * sqrt (_c /(_m + _c * _k)); (slightly faster to compute)
 */

private _c = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(CHARGE));
if (_c == 0) then {_c = 1; _warn = true;};
private _m = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(METAL));
if (_m == 0) then {_m = 2; _warn = true;};
private _k = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(GURNEY_K));
if (_k == 0) then {_k = 0.8; _warn = true;};
private _gC = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(GURNEY_C));
if (_gC == 0) then {_gC = 2440; _warn = true;};
private _fragCount = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(fragCount));
if (_fragCount == 0) then {_fragCount = 200; _warn = true;};

if (_warn) then {
    INFO_1("Ammo class %1 lacks proper explosive properties definitions for frag!",_ammo);
};

/********************** _ammoInfo format *************************//*
 * 0: _fragRange - search range for fragments, calculated with 
 *                  a 0.5% chance to hit as the minimum
 * 1: _fragVel - gurney equation calculated velocity
 * 2: _fragTypes - array of fragment types
 * 3: _fragCount - modified frag count used under assumptions 
 *                 of spherical fragmentation
 */
_ammoInfo = [
    sqrt (_fragCount / (4 * pi * 0.005)),
    0.8 * _gC * sqrt (_c / (_m + _c * _k)),
    _fragTypes,
    _fragCount / 4 / pi
];

GVAR(fragInfoCache) set [_ammo, _ammoInfo];
_ammoInfo