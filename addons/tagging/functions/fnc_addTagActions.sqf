#include "script_component.hpp"
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
    _x params ["_class", "_displayName", "_requiredItem", "_textures", "_icon"];

    _actions pushBack [
        [
            format ["ACE_ConfigTag_%1", _class],
            _displayName,
            _icon,
            {
                (_this select 2) params ["_unit", "_class", "_textures"];
                [_unit, selectRandom _textures] call FUNC(tag);
                _unit setVariable [QGVAR(lastUsedTag), _class];
            },
            {
                (_this select 2) params ["_unit", "", "", "_requiredItem"];
                _requiredItem in (_unit call EFUNC(common,uniqueItems))
            },
            {},
            [_unit, _class, _textures, _requiredItem]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
} forEach GVAR(cachedTags);

_actions
