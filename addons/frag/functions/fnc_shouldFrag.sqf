#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should cause fragmentation
 * and whether any submunitions exist
 * 
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
 * 
 * Return Value:
 * _shouldFrag Should the specific round fragment <BOOL>
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_shouldFrag;
 *
 * Public: No
 */

params ["_ammo"];

private _shouldFrag = GVAR(shouldFragCache) get _ammo;

if !(isNil "_shouldFrag") exitWith {_shouldFrag};

_shouldFrag = true;

private _skip = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(skip));
private _force = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(force));
private _explosive = getNumber (configFile >> "cfgAmmo" >> _ammo >> "explosive");
private _indirectHit = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHit");
private _indirectRange = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHitRange");

if (_skip == 1  || (_force == 0 && {_explosive < 0.5 || {_indirectHit < 3 
    || {_indirectRange < 5 && _indirectHit < _indirectRange}}})) then {
    TRACE_5("No frag",_ammo,_skip, _explosive, _indirectRange, _indirectHit);
    _shouldFrag = false;
};

GVAR(shouldFragCache) set [_ammo, _shouldFrag];

_shouldFrag