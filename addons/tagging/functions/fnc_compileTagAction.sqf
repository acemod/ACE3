#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Compiles tags from ACE_Tags and returns children actions.
 *
 * Arguments:
 * 0: Unique Identifier <STRING>
 * 1: Display Name <STRING>
 * 2: Required Item <STRING>
 * 3: Textures Paths <ARRAY of STRINGs>
 * 4: Icon Path <STRING> (default: "")
 * 5: Material Paths <ARRAY>
 * 6: Tag Model <STRING>
 * 7: Condition <CODE> (default: {true})
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_tagging_fnc_compileTagAction
 *
 * Public: No
 */

params ["_class", "_displayName", "_requiredItem", "_textures", "_icon", "_materials", "_tagModel", ["_condition", {true}]];

private _actions = GVAR(itemActions) getOrDefault [_requiredItem, []];

_actions pushBack ([
    _class,
    _displayName,
    _icon,
    {
        (_this select 2) params ["_class", "_textures", "_materials", "_tagModel"];

        (
            if (count _textures == count _materials) then {
                private _textureIndex = floor random count _textures;
                [_textures select _textureIndex, _materials select _textureIndex]
            } else {
                [selectRandom _textures, selectRandom _materials]
            }
        ) params ["_randomTexture", "_randomMaterial"];

        [_player, _randomTexture, _randomMaterial, _tagModel] call FUNC(tag);
        _player setVariable [QGVAR(lastUsedTag), _class];
    },
    _condition, // required item is checked at an upper level
    {},
    [_class, _textures, _materials, _tagModel]
] call EFUNC(interact_menu,createAction));

GVAR(itemActions) set [_requiredItem, _actions];
