/*
 * Author: Garth de Wet (LH)
 * Shows the interaction helper text with the mouse buttons at the bottom middle of the screen
 *
 * Arguments:
 * 0: Left Click Text <STRING>
 * 1: Right Click Text <STRING>
 * 2: Scroll Text <STRING> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Place Explosive", "Cancel"] call ace_interaction_fnc_showMouseHint
 *
 * Public: No
 */
#include "script_component.hpp"

#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)

params ["_leftClick", "_rightClick", ["_scroll", ""]];

(QGVAR(InteractionHelper) call BIS_fnc_rscLayer) cutRsc [QGVAR(InteractionHelper), "PLAIN", 0.5, false];

disableSerialization;

private _display = uiNamespace getVariable ["ACE_Helper_Display", objNull];

if (isNull _display) exitWith {};

(_display displayCtrl 1000) ctrlSetText _leftClick;
(_display displayCtrl 1001) ctrlSetText _rightClick;

(_display displayCtrl 1000) ctrlShow (_leftClick != "");
(_display displayCtrl 1200) ctrlShow (_leftClick != "");
(_display displayCtrl 1001) ctrlShow (_rightClick != "");
(_display displayCtrl 1201) ctrlShow (_rightClick != "");

if (_scroll == "") exitWith {
    (_display displayCtrl 1002) ctrlShow false;
    (_display displayCtrl 1202) ctrlShow false;
    (_display displayCtrl 1001) ctrlSetPosition [21 * GUI_GRID_W, 18 * GUI_GRID_H, 24 * GUI_GRID_W, 1.5 * GUI_GRID_H];
    (_display displayCtrl 1201) ctrlSetPosition [20 * GUI_GRID_W, 18.5 * GUI_GRID_H, 1.5 * GUI_GRID_W, 1 * GUI_GRID_H];
    (_display displayCtrl 1001) ctrlCommit 0;
    (_display displayCtrl 1201) ctrlCommit 0;
};

(_display displayCtrl 1002) ctrlSetText _scroll;

// Enable action menu
inGameUISetEventHandler ["PrevAction", "true"];
inGameUISetEventHandler ["NextAction", "true"];
inGameUISetEventHandler ["Action", "true"];
