/*
 * Author: MikeMatrix
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
#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};

GVAR(EnableTransmit) = true;
[FUNC(transmit), GVAR(interval), []] call CBA_fnc_addPerFrameHandler;
