/*
 * Author: commy2, Glowbal
 *
 * Display a structured text with image.
 *
 * Argument:
 * 0: Text <ANY>
 * 1: Image <STRING>
 * 2: Image color <ARRAY> <OPTIONAL>
 * 3: Target Unit. Will only display if target is the player controlled object <OBJECT> <OPTIONAL>
 *
 * Return value:
 * Nothing
 */

#include "script_component.hpp"

private ["_imageColor", "_target"];
PARAMS_2(_text,_image);
_imageColor = if (count _this > 2) then {_this select 2} else {[1,1,1]};
_imageColor resize 3;
_target = if (count _this > 3) then {_this select 3} else {ACE_player};

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") then {
    if (typeName _text == "ARRAY") then {
        if (count _text > 0) then {
            {
                if (typeName _x == "STRING" && {isLocalized _x}) then {
                    _text set [_foreachIndex, localize _x];
                };
            }foreach _text;
            _text = format _text;
        };
    };
    if (typeName _text == "STRING" && {isLocalized _text}) then {
        _text = localize _text;
    };
    _text = parseText format ["<t align='center'>%1</t>", _text];
};
_text = composeText [parseText format ["<img size='2' align='center' color='%2' image='%1'/>", _image, _imageColor call BIS_fnc_colorRGBtoHTML], lineBreak, _text];
[_text, 2] call FUNC(displayTextStructured);
