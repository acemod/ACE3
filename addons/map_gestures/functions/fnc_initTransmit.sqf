#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes transmitting map gestures.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_map_gestures_fnc_initTransmit
 *
 * Public: No
 */

if (!GVAR(enabled)) exitWith {};

GVAR(EnableTransmit) = true;
[FUNC(transmit), GVAR(interval), []] call CBA_fnc_addPerFrameHandler;
