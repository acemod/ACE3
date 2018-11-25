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
    _x params ["_class", "_displayName", "_requiredItem", "_textures", "_icon", "_materials"];

    _actions pushBack [
        [
            format ["ACE_ConfigTag_%1", _class],
            _displayName,
            _icon,
            {
                (_this select 2) params ["_unit", "_class", "_textures", "", "_materials"];
                private _randomTexture = selectRandom _textures;
                private _randomMaterial =  if (count _textures == count _materials) then {
                    _materials select (_textures find _randomTexture)
                } else {
                    selectRandom _materials
                };

                [_unit, _randomTexture, _randomMaterial] call FUNC(tag);
                _unit setVariable [QGVAR(lastUsedTag), _class];
            },
            {
                (_this select 2) params ["_unit", "", "", "_requiredItem"];
                _requiredItem in (_unit call EFUNC(common,uniqueItems))
            },
            {},
            [_unit, _class, _textures, _requiredItem, _materials]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
} forEach GVAR(cachedTags);

_actions
