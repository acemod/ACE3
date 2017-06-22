/*
 * Author: commy2, Glowbal
 * Display a structured text with image.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Image <STRING>
 * 2: Image color <ARRAY> (default: [1, 1, 1])
 * 3: Target Unit. Will only display if target is the player controlled object <OBJECT> (default: ACE_player)
 * 4: Size <NUMBER> (default: 2)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["text", "image", [1, 1, 1], ACE_player, 2] call ace_common_fnc_displayTextPicture
 * ["text", "image", nil, nil, 3] call ace_common_fnc_displayTextPicture
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_text", ""], ["_image", "", [""]], ["_imageColor", [1,1,1], [[]]], ["_target", ACE_player, [objNull]], ["_size", 2, [0]]];

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") then {
    if (_text isEqualType []) then {
        if (count _text > 0) then {
            {
                if (_x isEqualType "" && {isLocalized _x}) then {
                    _text set [_forEachIndex, localize _x];
                };
            } forEach _text;

            _text = format _text;
        };
    };

    if (_text isEqualType "" && {isLocalized _text}) then {
        _text = localize _text;
    };

    _text = parseText format ["<t align='center'>%1</t>", _text];
};

_text = composeText [parseText format ["<img size='2' align='center' color='%2' image='%1'/>", _image, _imageColor call BIS_fnc_colorRGBtoHTML], lineBreak, _text];

[_text, _size] call FUNC(displayTextStructured);
