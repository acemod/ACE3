/*
 * Author: Gundy
 *
 * Description:
 *   Toggle position of interface (display only) from left to right or reset dialog to default position
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_DK10_dlg",[0.2,0.1]] call ace_bft_onIfTogglePositionKey;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID"];

// bail if there is no interface open
if (I_CLOSED) exitWith {false};

_deviceID = I_GET_DEVICE;

if (I_GET_ISDIALOG) then {
    // reset position to default
    [_deviceID,[["dlgIfPosition",[]]],true,true] call FUNC(setSettings);
} else {
    _dspIfPosition = [_deviceID,"dspIfPosition"] call FUNC(getSettings);
    // toggle position
    [_deviceID,[["dspIfPosition",!_dspIfPosition]]] call FUNC(setSettings);
};

true