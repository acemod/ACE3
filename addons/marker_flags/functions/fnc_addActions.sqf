#include "..\script_component.hpp"
/*
 * Author: Brett Mayson, Timi007
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
    (GVAR(flagCache) get _x) params ["_vehicle", "_displayName", "_icon"];

    _actions pushBack [
        [
            _x,
            _displayName,
            _icon,
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
