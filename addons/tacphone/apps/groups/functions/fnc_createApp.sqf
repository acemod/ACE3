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

params ["_display", "_appSection"];

private _fullSize = [0, 0, (ctrlPosition _appSection)#2, (ctrlPosition _appSection)#3];

GVAR(appsection) = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _appSection];
GVAR(appsection) ctrlSetPosition _fullSize;
GVAR(appsection) ctrlCommit 0;

/*

    Do some stuff here

*/