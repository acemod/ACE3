#include "..\script_component.hpp"
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

private _grenadeType = [GVAR(GrenadesAll), GVAR(GrenadesFrag), GVAR(GrenadesNonFrag)] select _type;

// This is faster than checking magazines
private _grenades = (throwables _unit) apply {_x select 0} select {_x in _grenadeType};

// abort if no grenades are available
if (_grenades isEqualTo []) exitWith {false};

_grenades = _grenades arrayIntersect _grenades;

// get next grenade muzzle
private _nextGrenadeIndex = (_grenades find _currentGrenade) + 1;

// roll over if the last grenade was selected
if (_nextGrenadeIndex >= count _grenades) then {
    _nextGrenadeIndex = 0;
};

private _nextGrenade = _grenades select _nextGrenadeIndex;

[_nextGrenade, {_x == _nextGrenade} count (magazines _unit)] call FUNC(displayGrenadeTypeAndNumber);

_unit selectThrowable _nextGrenade // return
