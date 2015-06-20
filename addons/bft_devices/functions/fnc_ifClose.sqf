/*
 * Author: Gundy
 *
 * Description:
 *   Initiates the closing of currently open interface
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_ifClose;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_display"];

if !(I_CLOSED) then {
    // [_ifType,_displayName,_player,_playerKilledEhId,_vehicle,_vehicleGetOutEhId]
    _displayName = I_GET_NAME;
    _display = uiNamespace getVariable [_displayName,displayNull];
    
    if !(isNull _display) then {
        _display closeDisplay 0;
        // only call ifOnUnload for displays (dialogs call ifOnUnload themselves when they close)
        if !(I_GET_ISDIALOG) then {
            [] call FUNC(ifOnUnload);
        };
    };
};

true