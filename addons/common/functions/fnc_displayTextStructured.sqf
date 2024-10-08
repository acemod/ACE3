#include "..\script_component.hpp"
/*
 * Author: commy2, Glowbal, GitHawk
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
 * ["wow", 1, ace_player, 3] call ace_common_fnc_displayTextStructured
 *
 * Public: Yes
 */

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") then {
    if (_text isEqualType []) then {
        if (count _text > 0) then {
            {
                if (_x isEqualType "" && {isLocalized _x}) then {
                    _text set [_foreachIndex, localize _x];
                };
            } forEach _text;
            _text = format _text;
        };
    };
    if (_text isEqualType "" && {isLocalized _text}) then {
        _text = localize _text;
    };
    _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];
};

private _isShown = ctrlShown (uiNamespace getVariable ["ACE_ctrlHint", controlNull]);

("ACE_RscHint" call BIS_fnc_rscLayer) cutRsc ["ACE_RscHint", "PLAIN", 0, true];

disableSerialization;
private _ctrlHint = uiNamespace getVariable "ACE_ctrlHint";

_ctrlHint ctrlSetBackgroundColor GVAR(displayTextColor);
_ctrlHint ctrlSetTextColor GVAR(displayTextFontColor);

// Use profile settings from CfgUIGrids.hpp
private _xPos = profileNamespace getVariable ["IGUI_GRID_ACE_displayText_X", ((safeZoneX + safeZoneW) - (10 *(((safeZoneW / safeZoneH) min 1.2) / 40)) - 2.9 *(((safeZoneW / safeZoneH) min 1.2) / 40))];
private _yPos = profileNamespace getVariable ["IGUI_GRID_ACE_displayText_Y", safeZoneY + 0.175 * safeZoneH];
private _wPos =  (_width *(((safeZoneW / safeZoneH) min 1.2) / 40));
private _hPos = _size * (2 *((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25));

// Ensure still in bounds for large width/height
_xPos = safeZoneX max (_xPos min (safeZoneX + safeZoneW - _wPos));
_yPos = safeZoneY max (_yPos min (safeZoneY + safeZoneH - _hPos));

// Zeus Interface Open and Display would be under the "CREATE" list
if (!isNull curatorCamera) then {
    _xPos = _xPos min ((safeZoneX + safeZoneW - 12.5 * (((safeZoneW / safeZoneH) min 1.2) / 40)) - _wPos);
};

private _position = [_xPos, _yPos, _wPos, _hPos];

_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit 0;

_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit ([0.5, 0] select _isShown);
