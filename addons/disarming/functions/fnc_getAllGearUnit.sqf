#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Helper function to get all gear of a unit.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Array of 2 arrays, classnames and count <ARRAY>
 *
 * Example:
 * cursorTarget call ace_disarming_fnc_getAllGearUnit
 *
 * Public: No
 */

params ["_target"];

private _weapons = weapons _target;
private _allItems = (((items _target) + (assignedItems _target)) - _weapons) + _weapons + (magazines _target);
private _backpack = backpack _target;

if (_backpack != "") then {
    _allItems pushBack _backpack;
};

private _vest = vest _target;

if (_vest != "") then {
    _allItems pushBack _vest;
};

private _uniform = uniform _target;

if (_uniform != "") then {
    _allItems pushBack _uniform;
};

private _headgear = headgear _target;

if (_headgear != "") then {
    _allItems pushBack _headgear;
};

// What kind of asshole takes a man's glasses?
private _goggles = goggles _target;

if (_goggles != "") then {
    _allItems pushBack _goggles;
};

private _uniqueClassnames = [];
private _classnamesCount = [];
private _countA = count _allItems;

// From CBA_fnc_getArrayElements
while {_countA > 0} do {
     private _var = _allItems select 0;
     _allItems = _allItems - [_var];
     private _countB = count _allItems;
     _uniqueClassnames pushBack _var;
     _classnamesCount pushBack (_countA - _countB);
     _countA = _countB;
};

[_uniqueClassnames, _classnamesCount] // return
