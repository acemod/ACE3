/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes the receiver and hooks it to the Draw event of the map.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_map_gestures_fnc_receiverInit
 *
 * Public: No
 */
#include "script_component.hpp"

ACE_player setVariable [QGVAR(Transmit), false, true];
GVAR(EnableTransmit) = false;

if (!isNil QGVAR(DrawMapHandlerID)) then {
    (findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(DrawMapHandlerID)];
    GVAR(DrawMapHandlerID) = nil;
};
GVAR(DrawMapHandlerID) = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {call FUNC(drawMapGestures)}];
