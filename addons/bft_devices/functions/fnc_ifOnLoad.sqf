/*
 * Author: Gundy
 *
 * Description:
 *   Handles dialog / display setup, called by "onLoad" event
 *
 * Arguments:
 *   0: Display <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [_display] call ace_bft_devices_fnc_ifOnLoad;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

uiNamespace setVariable [I_GET_NAME, _display];

[] call FUNC(ifUpdate);

// setup bft_drawing
private _mapTypes = [I_GET_ID,"mapTypes"] call FUNC(getSettings);
{
    0 = [_display displayCtrl _x] call EFUNC(bft_drawing,doBFTDraw);
} count (_mapTypes select 1);

// send "bft_deviceOpened" event
["bft_deviceOpened",[I_GET_DEVICE]] call EFUNC(common,localEvent);

GVAR(ifOpenStart) = false;

true
