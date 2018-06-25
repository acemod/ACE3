#include "script_component.hpp"
/*
 * Author: Dslyecxi, MikeMatrix
 * Ensure that all variables used to indicate transmission are disabled.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_map_gestures_fnc_endTransmit
 *
 * Public: No
 */

if (!GVAR(enabled)) exitWith {};

ACE_player setVariable [QGVAR(Transmit), false, true];
GVAR(EnableTransmit) = false;
