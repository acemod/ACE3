#include "..\script_component.hpp"
/*
 * Author: KJW
 * Initializes the App
 *
 * Arguments:
 * TacPhone main display
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_groups_fnc_createApp
 *
 * Public: No
 */

params ["_display"];

GVAR(appsection) = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];

//#TODO this should be [0,0, (ctrlPosition _parent)#2, (ctrlPosition_parent)#3] and the parent gives us a controlsgroup to insert our things into
GVAR(appsection) ctrlSetPosition [(1-PHONE_WIDTH)/2, (1-PHONE_HEIGHT)/2, PHONE_WIDTH, PHONE_HEIGHT];
GVAR(appsection) ctrlCommit 0;

/*

    Do some stuff here

*/