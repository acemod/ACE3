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
 * _shouldFrag <ARRAY>
 * 	0 - Should the specific round fragment
 *  1 - Does the munition have a child submunition 
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_shouldFrag;
 *
 * Public: No
 */

params ["_ammo"];

private _shouldFrag = GVAR(shouldFragCache) get _ammo;

if !(isNil "_shouldFrag") exitWith {_shouldFrag};
// two arguments, 1st for munition should frag, 2nd for 
_shouldFrag = [true, false];

private _skip = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(skip));
private _force = getNumber (configFile >> "cfgAmmo" >> _ammo >> QGVAR(force));
private _explosive = getNumber (configFile >> "cfgAmmo" >> _ammo >> "explosive");
private _indirectHit = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHit");
private _indirectRange = getNumber(configFile >> "cfgAmmo" >> _ammo >> "indirectHitRange");

if (_skip == 1  || (_force == 0 && {_explosive < 0.5 || {_indirectHit < 3 
    || {_indirectRange < 5 && _indirectHit < _indirectRange}}})) then {
    TRACE_4("No frag" ,_skip, _explosive, _indirectRange, _indirectHit);
    _shouldFrag set [0, false];
};

if (GVAR(enSubMunit) > 0) then {
    private _hasSubmunit = if (isText (configFile >> "cfgAmmo" >> _ammo >> "submunitionAmmo")) then {
        "" isNotEqualTo  getText (configFile >> "cfgAmmo" >> _ammo >> "submunitionAmmo");
    } else
    {
        [] isNotEqualTo getArray (configFile >> "cfgAmmo" >> _ammo >> "submunitionAmmo");
    };

    _shouldFrag set [1, _hasSubmunit];
    TRACE_2("Submunition" ,_ammo, _hasSubmunit);
};

GVAR(shouldFragCache) set [_ammo, _shouldFrag];

_shouldFrag