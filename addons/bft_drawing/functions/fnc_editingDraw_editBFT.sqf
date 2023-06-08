#include "script_component.hpp"
/*
 * Author: [W] Fett_Li
 * Will be Draw Eventhandler for the map when clicked on a blueforcetracking symbol
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Public: No
 */


disableSerialization;

params ["_ctrl"];

// Remove Eventhandler
if (count (GVAR(selection) select 1) == 0) exitWith {_ctrl ctrlRemoveEventhandler ["Draw", GVAR(editingDraw_editBFT)]};

// Draw animation, but wait first for the initial zoom
if (ctrlMapAnimDone _ctrl) then {
    private _pos = AD_GET_POSITION(GVAR(selection));
    _ctrl ctrlMapAnimAdd [0, 0.05, _pos];
    ctrlMapAnimCommit _ctrl;
};
