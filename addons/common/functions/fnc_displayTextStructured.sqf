/*
 * Author: commy2, Glowbal
 *
 * Display a structured text.
 *
 * Argument:
 * 0: Text <ANY>
 * 1: Size of the textbox <NUMBER> <OPTIONAL>
 *
 * Return value:
 * Nothing
 */

#include "script_component.hpp"

private ["_text", "_size", "_isShown", "_ctrlHint", "_yPos", "_xPos", "_wPos", "_hPos", "_position"];

_text = _this select 0;
_size = _this select 1;

if (isNil "_size") then {_size = 1.5};

if (typeName _text != "TEXT") then {
    if (typeName _text == "STRING" && {isLocalized _text}) then {
        _text = localize _text;
    };
    _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];
};

_isShown = ctrlShown (uiNamespace getVariable ["ACE_ctrlHint", controlNull]);

("ACE_RscHint" call BIS_fnc_rscLayer) cutRsc ["ACE_RscHint", "PLAIN", 0, true];

disableSerialization;
_ctrlHint = uiNamespace getVariable "ACE_ctrlHint";

_ctrlHint ctrlSetBackgroundColor GVAR(displayTextColor);
/*
// This does not function at the moment. Has been disabled until it fixed.
_xPos = profilenamespace getvariable ["IGUI_GRID_ACE_displayText_X", ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40))];
_yPos = profilenamespace getvariable ["IGUI_GRID_ACE_displayText_Y", safeZoneY + 0.175 * safezoneH];
_wPos = profilenamespace getvariable ["IGUI_GRID_ACE_displayText_W", (10 *(((safezoneW / safezoneH) min 1.2) / 40))];
_hPos = profilenamespace getvariable ["IGUI_GRID_ACE_displayText_H", (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))];
*/

_xPos = ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
_yPos = safeZoneY + 0.175 * safezoneH;
_wPos =  (10 *(((safezoneW / safezoneH) min 1.2) / 40));
_hPos = (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
_position = [_xPos, _yPos, _wPos, _size * _hPos];

_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit 0;

_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition _position;
_ctrlHint ctrlCommit ([0.5, 0] select _isShown);
