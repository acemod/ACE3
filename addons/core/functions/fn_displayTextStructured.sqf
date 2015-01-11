/*
 * Author: commy2
 *
 * Display a structured text.
 *
 * Argument:
 * 0: Text (Anything)
 * 1: Size of the textbox (Number, optional default: 1)
 *
 * Return value:
 * Nothing
 */

private ["_text", "_size", "_isShown", "_ctrlHint"];

_text = _this select 0;
_size = _this select 1;

if (isNil "_size") then {_size = 1};

if (typeName _text != "TEXT") then {
  _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];
};

_isShown = ctrlShown (uiNamespace getVariable ["AGM_ctrlHint", controlNull]);

("AGM_RscHint" call BIS_fnc_rscLayer) cutRsc ["AGM_RscHint", "PLAIN", 0, true];

disableSerialization;
_ctrlHint = uiNamespace getVariable "AGM_ctrlHint";

_ctrlHint ctrlSetPosition [
  safeZoneW + safeZoneX - 0 * safezoneW,
  safeZoneY + 0.2 * safezoneH,
  0.2 * safeZoneW,
  _size * 0.1 * SafeZoneH
];
_ctrlHint ctrlCommit 0;

_ctrlHint ctrlSetStructuredText _text;
_ctrlHint ctrlSetPosition [
  safeZoneW + safeZoneX - 0.2 * safezoneW,
  safeZoneY + 0.2 * safezoneH,
  0.2 * safeZoneW,
  _size * 0.1 * SafeZoneH
];
_ctrlHint ctrlCommit ([0.2, 0] select _isShown);
