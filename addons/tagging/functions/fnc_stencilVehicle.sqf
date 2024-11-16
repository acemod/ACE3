#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles 3den attribute for vehicle ID markings
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Display Text <STRING>
 * 2: Text Size <NUMBER> (Optional)
 * 3: Text Color <STRING> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [truck, "BARVO-1 Bastards"] call ace_tagging_fnc_stencilVehicle
 *
 * Public: No
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_text", "", [""]],
    ["_textSize", 0.3, [0]], // Fits about 7-8 chars in width
    ["_textcolor", "f7e9e1f8", [""]] // making text color slightly transparent (f8) fixes a "shimmering" problem (possibly related to HBAO)
];
TRACE_2("",_vehicle,_text);

if (!isServer) exitWith {};
if (_text == "") exitWith {};
private _clanSel = getText (configOf _vehicle >> "selectionClan");
if !(_clanSel in selectionNames _vehicle) exitWith {TRACE_1("no tag",_clanSel);};

private _texture = [_text, _textSize, _textColor, "00000000", true] call FUNC(generateStencilTexture);
TRACE_1("",_texture);
if (_texture == "") exitWith { ERROR_1("bad texture params %1",_this); };
[[], [], _texture, _vehicle, objNull, "", "", true] call FUNC(createTag); // apply texture and send event
