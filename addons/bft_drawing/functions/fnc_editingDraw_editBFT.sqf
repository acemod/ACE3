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

#include "script_component.hpp"

disableSerialization;
private "_ctrl";
_ctrl = _this select 0;

// Remove Eventhandler
if (count (GVAR(selection) select 1) == 0) exitWith {(_this select 0) ctrlRemoveEventhandler ["Draw",GVAR(editingDraw_editBFT)]};

// Draw animation, but wait first for the initial zoom
if (ctrlMapAnimDone _ctrl) then {
    _pos = AD_GET_POSITION(GVAR(selection));
    _ctrl ctrlMapAnimAdd [0,0.05,_pos];
    ctrlMapAnimCommit _ctrl;
};
