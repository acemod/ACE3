/*
 * Author: commy2, Glowbal
 *
 * Display a structured text with image.
 *
 * Argument:
 * 0: Text <ANY>
 * 1: Image <STRING>
 *
 * Return value:
 * Nothing
 */

#include "script_component.hpp"

private ["_text", "_image"];
_text = _this select 0;
_image = _this select 1;

if (typeName _text != "TEXT") then {
  if (typeName _text == "STRING" && {isLocalized _text}) then {
        _text = localize _text;
    };
  	_text = parseText format ["<t align='center'>%1</t>", _text];
};
_text = composeText [parseText format ["<img size='2' align='center' color='#ffffff' image='%1'/>", _image], lineBreak, _text];
[_text, 2] call FUNC(displayTextStructured);
