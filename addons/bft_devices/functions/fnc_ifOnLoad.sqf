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

private ["_displayName","_mapTypes"];

_displayName = I_GET_NAME;

uiNamespace setVariable [_displayName,_this select 0];

[] call FUNC(ifUpdate);

// setup bft_drawing
_mapTypes = [I_GET_ID,"mapTypes"] call FUNC(getSettings);
{
	0 = [(_this select 0) displayCtrl _x] call EFUNC(bft_drawing,doBFTDraw);
} count (_mapTypes select 1);

// send "bft_deviceOpened" event
["bft_deviceOpened",[I_GET_DEVICE]] call EFUNC(common,localEvent);

GVAR(ifOpenStart) = false;

true