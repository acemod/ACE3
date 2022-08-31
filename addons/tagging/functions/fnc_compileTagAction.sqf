#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Compiles tags from ACE_Tags and returns children actions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_tagging_fnc_compileTagAction
 *
 * Public: No
 */

params ["_class", "_displayName", "_requiredItem", "_textures", "_icon", "_materials"];

private _actions = GVAR(itemActions) getOrDefault [_requiredItem, []];

_actions pushBack ([
    _class,
    _displayName,
    _icon,
    {
        (_this select 2) params ["_class", "_textures", "_materials"];

        (
            if (count _textures == count _materials) then {
                private _textureIndex = floor random count _textures;
                [_textures select _textureIndex, _materials select _textureIndex]
            } else {
                [selectRandom _textures, selectRandom _materials]
            }
        ) params ["_randomTexture", "_randomMaterial"];

        [_player, _randomTexture, _randomMaterial] call FUNC(tag);
        _player setVariable [QGVAR(lastUsedTag), _class];
    },
    {true}, // required item is checked at an upper level
    {},
    [_class, _textures, _materials]
] call EFUNC(interact_menu,createAction));

GVAR(itemActions) set [_requiredItem, _actions];
