/*
 * Author: commy2
 *
 * Display a structured text with image.
 *
 * Argument:
 * 0: Text (Anything)
 * 1: Image (String)
 *
 * Return value:
 * Nothing
 */
#include "\z\ace\addons\core\script_component.hpp"

private ["_text", "_image"];

_text = _this select 0;
_image = _this select 1;

if (typeName _text != "TEXT") then {
  _text = parseText format ["<t align='center'>%1</t>", _text];
};

_text = composeText [
  parseText format ["<img size='2.5' align='center' color='#ffffff' image='%1'/>", _image],
  lineBreak,
  _text
];

[_text] call FUNC(displayTextStructured);
