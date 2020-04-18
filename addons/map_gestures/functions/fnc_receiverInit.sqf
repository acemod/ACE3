#include "script_component.hpp"
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

TRACE_1("receiverInit",_this);

ACE_player setVariable [QGVAR(Transmit), false, true];
GVAR(EnableTransmit) = false;

["Draw", {call FUNC(drawMapGestures)}, true] call EFUNC(common,addMapEventHandler);
