#include "script_component.hpp"
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


params ["_display"];

uiNamespace setVariable [I_GET_NAME, _display];

[] call FUNC(ifUpdate);

// setup bft_drawing
private _mapTypes = [I_GET_ID,"mapTypes"] call FUNC(getSettings);

{
    [_display displayCtrl ([_mapTypes, _x] call CBA_fnc_hashGet)] call EFUNC(bft_drawing,doBFTDraw);
} forEach ([_mapTypes] call CBA_fnc_hashKeys);

// send "bft_deviceOpened" event
["bft_deviceOpened",[I_GET_DEVICE]] call CBA_fnc_localEvent;

GVAR(ifOpenStart) = false;

true
