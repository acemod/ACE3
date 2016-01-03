/*
 * Author: commy2, Glowbal
 * Display a structured text.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Size of the textbox (default: 1.5) <NUMBER>
 * 2: Target Unit. Will only display if target is the player controlled object (default: ACE_player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_text", ["_size", 1.5], ["_target", ACE_player]];

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

private ["_isShown", "_ctrlHint", "_xPos", "_yPos", "_wPos", "_hPos", "_position"];

_isShown = ctrlShown (uiNamespace getVariable ["ACE_ctrlHint", controlNull]);

("ACE_RscHint" call BIS_fnc_rscLayer) cutRsc ["ACE_RscHint", "PLAIN", 0, true];

disableSerialization;
_ctrlHint = uiNamespace getVariable "ACE_ctrlHint";

_ctrlHint ctrlSetBackgroundColor GVAR(displayTextColor);
_ctrlHint ctrlSetTextColor GVAR(displayTextFontColor);
/*
// This does not function at the moment. Has been disabled until it fixed.
_xPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_X", ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40))];
_yPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_Y", safeZoneY + 0.175 * safezoneH];
_wPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_W", (10 *(((safezoneW / safezoneH) min 1.2) / 40))];
_hPos = profilenamespace getVariable ["IGUI_GRID_ACE_displayText_H", (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))];
*/

_xPos = ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
_yPos = safeZoneY + 0.175 * safezoneH;
_wPos =  (10 *(((safezoneW / safezoneH) min 1.2) / 40));
_hPos = (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));

// Zeus Interface Open and Display would be under the "CREATE" list
if (!isNull curatorCamera) then {
    _xPos = _xPos min ((safezoneX + safezoneW - 12.5 * (((safezoneW / safezoneH) min 1.2) / 40)) - _wPos);
};

_position = [_xPos, _yPos, _wPos, _size * _hPos];

_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit 0;

_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit ([0.5, 0] select _isShown);
