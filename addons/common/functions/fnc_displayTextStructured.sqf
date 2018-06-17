/*
 * Author: commy2, Glowbal, GitHawk, mharis001
 * Display a structured text.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Size of the textbox <NUMBER> (default: 1.5)
 * 2: Target Unit. Will only display if target is the player controlled object <OBJECT> (default: ACE_player)
 * 3: Custom Width <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["Test: %1", 123], 1.5] call ace_common_fnc_displayTextStructured
 * ["wow", 1, ACE_player, 3] call ace_common_fnc_displayTextStructured
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") then {
    if (_text isEqualType [] && {!(_text isEqualTo [])}) then {
        {
            if (_x isEqualType "" && {isLocalized _x}) then {
                _text set [_forEachIndex, localize _x];
            };
        } forEach _text;
        _text = format _text;
    };
    if (_text isEqualType "" && {isLocalized _text}) then {
        _text = localize _text;
    };
    _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];
};

("ACE_RscHint" call BIS_fnc_rscLayer) cutRsc ["ACE_RscHint", "PLAIN", 0, true];
private _ctrlHint = GETUVAR(ACE_ctrlHint,controlNull);

_ctrlHint ctrlSetBackgroundColor GVAR(displayTextColor);
_ctrlHint ctrlSetTextColor GVAR(displayTextFontColor);

// Position display based profile settings
private _xPos = profileNamespace getVariable ['TRIPLES(IGUI,GVAR(gridDisplayText),X)', safeZoneX + safeZoneW - 12.9 * GUI_GRID_W];
private _yPos = profileNamespace getVariable ['TRIPLES(IGUI,GVAR(gridDisplayText),Y)', safeZoneY + 0.175 * safeZoneH];
private _wPos = _width * GUI_GRID_W;
private _hPos = _size * 2 * GUI_GRID_H;

// Ensure control is still in bounds of screen
_xPos = safeZoneX max (_xPos min (safeZoneX + safeZoneW - _wPos));
_yPos = safeZoneY max (_yPos min (safeZoneY + safeZoneH - _hPos));

// Ensure control will not be under the "CREATE" list in the Zeus interface
if (!isNull curatorCamera) then {
    _xPos = _xPos min (safeZoneX + safeZoneW - 12.5 * GUI_GRID_W - _wPos);
};

private _position = [_xPos, _yPos, _wPos, _hPos];
_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit 0;
