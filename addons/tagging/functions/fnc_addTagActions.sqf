#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Compiles tags from ACE_Tags and returns children actions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_tagging_fnc_addTagActions
 *
 * Public: No
 */

params ["_unit"];

private _actions = [];
{
    _actions pushBack [
        [
            format ["ACE_TagItem_%1", _x],
            getText (configFile >> "CfgWeapons" >> _x >> "displayName"),
            getText (configFile >> "CfgWeapons" >> _x >> "picture"),
            {},
            {(_this select 2) in (_player call EFUNC(common,uniqueItems))},
            {},
            _x
        ] call EFUNC(interact_menu,createAction),
        _y apply { [_x, [], _unit] }, //sub-actions for each individual tag
        _unit
    ]
} forEach GVAR(itemActions);
_actions
