/*
 * Author: commy2
 *
 * Called from config. Returns true if the player is a gunner and the players current vehicle has a FCS.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

getNumber ([configFile >> "CfgVehicles" >> typeOf vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call EFUNC(common,getTurretConfigPath) >> QGVAR(Enabled)) == 1
&& {cameraView == "GUNNER"}
