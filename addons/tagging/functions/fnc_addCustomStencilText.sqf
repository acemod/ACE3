#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adds custom text tag. Has to be executed on one machine only.
 *
 * Arguments:
 * 1: Display Text <STRING>
 * 2: Required Items <STRING>
 * 3: Text Color (in HEX 6 or 8) <STRING>
 * 4: BG Color (in HEX 6 or 8) <STRING>
 * 5: Text Size <NUMBER>
 *
 * Return Value:
 * Sucessfully Added Tag <BOOL>
 *
 * Example:
 * ["Orcs Go Home", nil, nil, nil, 0.22] call ace_tagging_fnc_addCustomStencilText
 * ["LOGI-2", "ACE_SpraypaintBlack", "f7e9e1", nil, 0.3] call ace_tagging_fnc_addCustomStencilText
 *
 * Public: Yes
 */

params [
    ["_text", "", [""]],
    ["_requiredItem", "ACE_SpraypaintBlack", [""]],
    ["_textColor", "000000", [""]],
    ["_backgroundColor", "00000000", [""]],
    ["_textSize", 0.3, [0]]
];

// Verify
if (_text == "") exitWith { ERROR_1("bad text %1",_text); false };
if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) exitWith { ERROR_1("bad item %1",_requiredItem); false };

if (_textColor select [0, 1] == "#") then { _textColor = _textColor select [1]; };
if (_backgroundColor select [0, 1] == "#") then { _backgroundColor = _backgroundColor select [1]; };
if (!((count _textColor) in [6,8])) exitWith { ERROR_1("bad tcolor %1",_textColor); false };
if (!((count _backgroundColor) in [6,8])) exitWith { ERROR_1("bad bcolor %1",_textColor); false };

private _identifier = format ["%1_%2_%3",_text,_textColor,_backgroundColor];
private _texture = format ['#(rgb,512,512,3)text(1,1,"SairaStencilOne",%1,"#%2","#%3","%4")', _textSize, _backgroundColor, _textColor, _text];

TRACE_2("",_identifier,_texture);

[_identifier, _text, _requiredItem, [_texture]] call FUNC(addCustomTag) // return
