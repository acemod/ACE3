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
 *   ["ace_bft_devices_DK10_dlg",[0.2,0.1]] call ace_bft_fnc_onIfTogglePositionKey;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_interfaceID"];

// bail if there is no interface open
if (I_CLOSED) exitWith {false};

_interfaceID = I_GET_ID;

if (I_GET_ISDIALOG) then {
    // reset position to default
    [_interfaceID,[["dlgIfPosition",[]]],true,true] call FUNC(setSettings);
} else {
    _dspIfPosition = [_interfaceID,"dspIfPosition"] call FUNC(getSettings);
    // toggle position
    [_interfaceID,[["dspIfPosition",!_dspIfPosition]]] call FUNC(setSettings);
};

true