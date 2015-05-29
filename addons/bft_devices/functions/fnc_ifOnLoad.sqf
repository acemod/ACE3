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
 *   [_dispaly] call ace_bft_devices_fnc_ifOnLoad;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_mapTypes"];

_displayName = GVAR(ifOpen) select 1;

uiNamespace setVariable [_displayName,_this select 0];

[] call FUNC(ifUpdate);

// set up bft_drawing
_mapTypes = [_displayName,"mapTypes"] call FUNC(getSettings);
{
	0 = [(_this select 0) displayCtrl _x] call EFUNC(bft_drawing,doBFTDraw);
} count (_mapTypes select 1);

GVAR(ifOpenStart) = false;

true