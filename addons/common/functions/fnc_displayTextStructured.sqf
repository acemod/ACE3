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
#include "script_component.hpp"

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") then {
    if (_text isEqualType []) then {
        if (count _text > 0) then {
            {
                if (_x isEqualType "" && {isLocalized _x}) then {
                    _text set [_foreachIndex, localize _x];
                };
            }foreach _text;
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
/*
// This does not function at the moment. Has been disabled until it fixed.
private _xPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_X", ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40))];
private _yPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_Y", safeZoneY + 0.175 * safezoneH];
private _wPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_W", (10 *(((safezoneW / safezoneH) min 1.2) / 40))];
private _hPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_H", (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))];
*/

private _xPos = ((safezoneX + safezoneW) - (_width *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
private _yPos = safeZoneY + 0.175 * safezoneH;
private _wPos =  (_width *(((safezoneW / safezoneH) min 1.2) / 40));
private _hPos = (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));

// Zeus Interface Open and Display would be under the "CREATE" list
if (!isNull curatorCamera) then {
    _xPos = _xPos min ((safezoneX + safezoneW - 12.5 * (((safezoneW / safezoneH) min 1.2) / 40)) - _wPos);
};

private _position = [_xPos, _yPos, _wPos, _size * _hPos];

_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit 0;

_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit ([0.5, 0] select _isShown);
