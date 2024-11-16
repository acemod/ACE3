#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds custom text tag. Has to be executed on one machine only.
 *
 * Arguments:
 * 0: Display Text <STRING>
 * 1: Text Size <NUMBER> (default: 0.3)
 * 2: Required Item <STRING> (default: "ACE_SpraypaintBlack")
 * 3: Text Color (in HEX 6 or 8) <STRING> (default: based on spray item)
 * 4: Background Color (in HEX 6 or 8) <STRING> (default: "00000000" - transparent)
 * 5: Auto newlines <BOOL> (default: true)
 *
 * Return Value:
 * Sucessfully Added Tag <BOOL>
 *
 * Example:
 * ["Orcs Go Home", 0.22] call ace_tagging_fnc_addStencilTag
 * ["LOGI-2", 0.3, "ACE_SpraypaintBlack", "f7e9e1"] call ace_tagging_fnc_addStencilTag
 *
 * Public: Yes
 */

params [
    ["_text", "", [""]],
    ["_textSize", 0.3, [0]],
    ["_requiredItem", "ACE_SpraypaintBlack", [""]],
    ["_textColor", "", [""]],
    ["_backgroundColor", "00000000", [""]],
    ["_autoMultiline", true, [false]]
];
TRACE_6("",_text,_textSize,_requiredItem,_textColor,_backgroundColor,_autoMultiline);

if (_text == "") exitWith { ERROR_1("bad text %1",_text); false };
// Check required item exists
if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) exitWith { ERROR_1("bad item %1",_requiredItem); false };
// Get color from spray item used
if (_textColor == "") then {
    _textColor = getText (configFile >> "CfgWeapons" >> _requiredItem >> QGVAR(textColor));
    if (_textColor == "") then { _textColor = "000000" };
};


private _identifier = format ["%1_%2_%3",_text,_textColor,_backgroundColor];
private _interactionText = _text regexReplace ["\\n", " "];
private _texture = [_text, _textSize, _textColor, _backgroundColor, _autoMultiline] call FUNC(generateStencilTexture);
TRACE_2("",_identifier,_texture);
if (_texture == "") exitWith { ERROR_1("bad texture params %1",_this); false };

[_identifier, _interactionText, _requiredItem, [_texture]] call FUNC(addCustomTag) // return
