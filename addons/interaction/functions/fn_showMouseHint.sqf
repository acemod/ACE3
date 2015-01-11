/*
	Name: AGM_Interaction_fnc_showMouseHint
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Shows the interaction helper text with the mouse buttons at the bottom middle of the screen
	
	Parameters:
		0: STRING - Left click text
		1: STRING - Right click text
		3: STRING - (Optional) Scroll text
	
	Returns:
		Nothing
	
	Example:
		["Place Explosive", "Cancel"] call AGM_Interaction_fnc_showMouseHint;
*/
#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)
private ["_leftClick", "_rightClick", "_scroll"];
_leftClick = _this select 0;
_rightClick = _this select 1;
_scroll = "";
if (count _this > 2) then {
	_scroll = _this select 2;
};

("AGM_InteractionHelper" call BIS_fnc_rscLayer) cutRsc ["AGM_InteractionHelper", "PLAIN",0.5, false];
disableSerialization;
_display = uiNamespace getVariable ["AGM_Helper_Display", objNull];
if (isNull _display) exitWith{};

(_display displayCtrl 1000) ctrlSetText _leftClick;
(_display displayCtrl 1001) ctrlSetText _rightClick;

(_display displayCtrl 1000) ctrlShow (_leftClick != "");
(_display displayCtrl 1200) ctrlShow (_leftClick != "");
(_display displayCtrl 1001) ctrlShow (_rightClick != "");
(_display displayCtrl 1201) ctrlShow (_rightClick != "");

if (_scroll == "") exitWith {
	(_display displayCtrl 1002) ctrlShow false;
	(_display displayCtrl 1202) ctrlShow false;

	(_display displayCtrl 1001)	ctrlSetPosition [21 * GUI_GRID_W, 18 * GUI_GRID_H, 8 * GUI_GRID_W, 1.5 * GUI_GRID_H];
	(_display displayCtrl 1201)	ctrlSetPosition [20 * GUI_GRID_W, 18.5 * GUI_GRID_H, 1 * GUI_GRID_W, 1 * GUI_GRID_H];
	(_display displayCtrl 1001) ctrlCommit 0;
	(_display displayCtrl 1201) ctrlCommit 0;
};
(_display displayCtrl 1002) ctrlSetText _scroll;
showHUD false;