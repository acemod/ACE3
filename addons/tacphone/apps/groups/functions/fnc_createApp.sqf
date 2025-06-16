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

_appsection = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _appSection];
_appsection ctrlSetPosition _fullSize;
_appsection ctrlCommit 0;

/*

    Do some stuff here

*/

uiNamespace setVariable [QGVAR(appSection),_appSection];