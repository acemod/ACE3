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

private ["_displayName"];

// bail if there is no interface open
if (I_CLOSED) exitWith {false};

_displayName = I_GET_NAME;

if (I_GET_ISDIALOG) then {
    // reset position to default
    [_displayName,[["dlgIfPosition",[]]],true,true] call FUNC(setSettings);
} else {
    _dspIfPosition = [_displayName,"dspIfPosition"] call FUNC(getSettings);
    // toggle position
    [_displayName,[["dspIfPosition",!_dspIfPosition]]] call FUNC(setSettings);
};

true