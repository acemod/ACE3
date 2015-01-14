/*
 * Author: commy2
 *
 * Called from config. Returns true if the player is a gunner and the players current vehicle has a FCS.
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Boolean (Bool)
 */

#include "script_component.hpp"

_player == gunner _vehicle
&& {getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(Enabled)) == 1}
&& {cameraView == "GUNNER"}
