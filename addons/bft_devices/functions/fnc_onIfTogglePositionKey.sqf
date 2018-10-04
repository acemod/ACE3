#include "script_component.hpp"
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
 *   [] call ace_bft_fnc_onIfTogglePositionKey;
 *
 * Public: No
 */


// bail if there is no interface open
if (I_CLOSED) exitWith {false};

private _interfaceID = I_GET_ID;

if (I_GET_ISDIALOG) then {
    // reset position to default
    [_interfaceID,[["dlgIfPosition",[]]],true,true] call FUNC(setSettings);
} else {
    private _dspIfPosition = [_interfaceID,"dspIfPosition"] call FUNC(getSettings);
    // toggle position
    [_interfaceID,[["dspIfPosition",!_dspIfPosition]]] call FUNC(setSettings);
};

true
