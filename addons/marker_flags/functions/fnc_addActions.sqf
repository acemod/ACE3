#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Adds the child actions for placing flags.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player] call ace_marker_flags_fnc_addActions
 *
 * Public: No
 */

params ["_unit"];

private _actions = [];

{
    private _config = configFile >> "CfgWeapons" >> _x;
    _actions pushBack [
        [
            _x,
            getText (_config >> "displayName"),
            getText (_config >> "picture"),
            {[_this select 0, _this select 2] call FUNC(placeFlag)},
            {true},
            {},
            _x
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
} forEach ([_unit] call FUNC(getFlags));

_actions
