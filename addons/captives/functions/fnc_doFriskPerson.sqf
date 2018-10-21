#include "script_component.hpp"
/*
 * Author: bux578
 * Open the select menu with the "personal" items of a frisked unit.  It only shows "handgunWeapon", "uniformItems", "vestItems", "backpackItems" and "assignedItems" because every other item is visible on the character
 *
 * Arguments:
 * 0: player unit <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_doFristPerson;
 *
 * Public: No
 */

params ["_player", "_unit"];

private _weapon = currentWeapon _player;
if (_weapon == primaryWeapon _player && {_weapon != ""}) then {
    [_player, "AmovPercMstpSlowWrflDnon", 0] call EFUNC(common,doAnimation);
};

private _listedItemClasses = [];

private _actions = [localize LSTRING(FriskMenuHeader), ""] call ACE_Interaction_fnc_prepareSelectMenu;

private _allGear = [];

if ((handgunWeapon _unit) != "") then {
    _allGear pushBack (handgunWeapon _unit);
};
if (count (uniformItems _unit) > 0) then {
    _allGear = _allGear + (uniformItems _unit);
};
if (count (vestItems _unit) > 0) then {
    _allGear = _allGear + (vestItems _unit);
};
if (count (backpackItems _unit) > 0) then {
    _allGear = _allGear + (backpackItems _unit);
};
if (count (assignedItems _unit) > 0) then {
    _allGear = _allGear + (assignedItems _unit);
};

// Handgun
// Uniform Items
// Vest Items
// Backpack Items
// Assigned Items
{
    if (!(_x in _listedItemClasses)) then {
        private _item = configFile >> "CfgMagazines" >> _x;
        if (isNil "_item" || str _item == "") then {  //str _item ?
            _item = configFile >> "CfgWeapons" >> _x;
        };
        _actions = [_actions, getText(_item >> "displayName"), getText(_item >> "picture"), _x] call ACE_Interaction_fnc_addSelectableItem;
        _listedItemClasses pushBack _x;
    };
} forEach (_allGear);

[_actions, {call ACE_Interaction_fnc_hideMenu;}, {call ACE_Interaction_fnc_hideMenu;}] call ACE_Interaction_fnc_openSelectMenu;

// don't need an "Ok" Button
ctrlShow [8860, false];
