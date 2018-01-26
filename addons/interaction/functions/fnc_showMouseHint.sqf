/*
 * Author: Garth de Wet (LH)
 * Shows the interaction helper text with the mouse buttons at the bottom middle of the screen.
 *
 * Arguments:
 * 0: Left Click Text <STRING>
 * 1: Right Click Text <STRING>
 * 2: Scroll Text <STRING> (default: "")
 * 2: Extra Icon/Text pairs <ARRAY> (default: [])
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

params ["_leftClick", "_rightClick", ["_scroll", ""], ["_extraIconSets", []]];

(QGVAR(InteractionHelper) call BIS_fnc_rscLayer) cutRsc [QGVAR(InteractionHelper), "PLAIN", 0.5, false];

disableSerialization;

private _display = uiNamespace getVariable ["ACE_Helper_Display", objNull];

if (isNull _display) exitWith {WARNING("Display was null");};

(_display displayCtrl 1000) ctrlSetText _leftClick;
(_display displayCtrl 1001) ctrlSetText _rightClick;

(_display displayCtrl 1000) ctrlShow (_leftClick != "");
(_display displayCtrl 1200) ctrlShow (_leftClick != "");
(_display displayCtrl 1001) ctrlShow (_rightClick != "");
(_display displayCtrl 1201) ctrlShow (_rightClick != "");

private _offset = 19;

if (_scroll == "") then {
    (_display displayCtrl 1002) ctrlShow false;
    (_display displayCtrl 1202) ctrlShow false;
    (_display displayCtrl 1001) ctrlSetPosition [21 * GUI_GRID_W, 18 * GUI_GRID_H, 24 * GUI_GRID_W, 1.5 * GUI_GRID_H];
    (_display displayCtrl 1201) ctrlSetPosition [20 * GUI_GRID_W, 18.5 * GUI_GRID_H, 1.5 * GUI_GRID_W, 1 * GUI_GRID_H];
    (_display displayCtrl 1001) ctrlCommit 0;
    (_display displayCtrl 1201) ctrlCommit 0;
} else {
    _offset = _offset + 1;
    (_display displayCtrl 1002) ctrlSetText _scroll;

    // Disable action menu
    inGameUISetEventHandler ["PrevAction", "true"];
    inGameUISetEventHandler ["NextAction", "true"];
    inGameUISetEventHandler ["Action", "true"];
};

{
    _x params [["_xKeyName", "", [""]], ["_xText", "", [""]]];
    switch (toLower _xKeyName) do {
        case ("alt"): {_xKeyName = format ["<%1>", toUpper localize "str_dik_alt"];};
        case ("control");
        case ("ctrl"): {_xKeyName = format ["<%1>", toUpper localize "str_dik_control"];};
        case ("shift"): {_xKeyName = format ["<%1>", toUpper localize "str_dik_shift"];};
    };

    private _keyNameCtrl = _display ctrlCreate ["RscInteractionText_right", -1];
    private _textCtrl = _display ctrlCreate ["RscInteractionText", -1];
    _keyNameCtrl ctrlSetText _xKeyName;
    _textCtrl ctrlSetText _xText;
    _keyNameCtrl ctrlSetPosition [0 * GUI_GRID_W, _offset * GUI_GRID_H, 21.4 * GUI_GRID_W, 1.5 * GUI_GRID_H];
    _textCtrl ctrlSetPosition [21 * GUI_GRID_W, _offset * GUI_GRID_H, 24 * GUI_GRID_W, 1.5 * GUI_GRID_H];
    _keyNameCtrl ctrlCommit 0;
    _textCtrl ctrlCommit 0;
    _offset = _offset + 1;
} forEach _extraIconSets;

