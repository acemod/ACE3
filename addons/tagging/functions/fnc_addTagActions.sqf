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

private _itemsActions = createHashMap;
{
    _x params ["_class", "_displayName", "_requiredItem", "_textures", "_icon", "_materials"];
    private _actions = _itemsActions getOrDefault [_requiredItem, []];
    _actions pushBack [
        [
            format ["ACE_ConfigTag_%1", _class],
            _displayName,
            _icon,
            {
                (_this select 2) params ["_unit", "_class", "_textures", "", "_materials"];

                (
                    if (count _textures == count _materials) then {
                        private _textureIndex = floor random count _textures;
                        [_textures select _textureIndex, _materials select _textureIndex]
                    } else {
                        [selectRandom _textures, selectRandom _materials]
                    }
                ) params ["_randomTexture", "_randomMaterial"];

                [_unit, _randomTexture, _randomMaterial] call FUNC(tag);
                _unit setVariable [QGVAR(lastUsedTag), _class];
            },
            {true},
            {},
            [_unit, _class, _textures, _requiredItem, _materials]
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
    _itemsActions set [_requiredItem, _actions];
} forEach GVAR(cachedTags);

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
        _y, //sub-actions for each individual tag
        _unit
    ]
} forEach _itemsActions;
_actions
