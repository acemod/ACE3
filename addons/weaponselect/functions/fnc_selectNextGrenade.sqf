#include "script_component.hpp"
/*
 * Author: commy2
 * Select the next grenade.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Grenade type [0: all, 1: frags, 2: non-frags] (default: 0) <NUMBER>
 *
 * Return Value:
 * Selecting successful? <BOOL>
 *
 * Example:
 * [player] call ace_weaponselect_fnc_selectNextGrenade
 *
 * Public: Yes
 */

params ["_unit", ["_type", 0]];

// get currently selected grenade
private _currentGrenade = currentThrowable _unit;

// get correct array format if no grenade is selected
if (_currentGrenade isEqualTo []) then {
    _currentGrenade = ["", ""];
};

_currentGrenade = _currentGrenade select 0;

// get available magazines for that unit
private _magazines = magazines _unit;

private _grenades = [];

{
    if (_x in _magazines) then {
        _grenades pushBack _x;
    };
    false
} count ([GVAR(GrenadesAll), GVAR(GrenadesFrag), GVAR(GrenadesNonFrag)] select _type);

// abort if no grenades are available
if (_grenades isEqualTo []) exitWith {false};

// get next grenade muzzle
private _nextGrenadeIndex = (_grenades find _currentGrenade) + 1;

// roll over if the last grenade was selected
if (_nextGrenadeIndex >= count _grenades) then {
    _nextGrenadeIndex = 0;
};

private _nextGrenade = _grenades select _nextGrenadeIndex;

// abort if the same grenade would be selected
if (_currentGrenade == _nextGrenade) exitWith {false};

// current best method to select a grenade: remove all grenades except the one you want to select, then add them back
private _uniformGrenades =  uniformItems  _unit select {_x in GVAR(GrenadesAll) && {_x != _nextGrenade}};
private _vestGrenades =     vestItems     _unit select {_x in GVAR(GrenadesAll) && {_x != _nextGrenade}};
private _backpackGrenades = backpackItems _unit select {_x in GVAR(GrenadesAll) && {_x != _nextGrenade}};

// remove all grenades except those we are switching to --> this breaks the selector
{_unit removeItemFromUniform  _x; false} count _uniformGrenades;
{_unit removeItemFromVest     _x; false} count _vestGrenades;
{_unit removeItemFromBackpack _x; false} count _backpackGrenades;

// readd grenades
{_unit addItemToUniform  _x; false} count _uniformGrenades;
{_unit addItemToVest     _x; false} count _vestGrenades;
{_unit addItemToBackpack _x; false} count _backpackGrenades;

[_nextGrenade, {_x == _nextGrenade} count _magazines] call FUNC(displayGrenadeTypeAndNumber);

true
