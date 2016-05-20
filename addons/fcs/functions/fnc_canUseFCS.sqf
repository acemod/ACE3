/*
 * Author: commy2
 * Called from config. Returns true if the player is a gunner and the players current vehicle has a FCS.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [] call ace_fcs_fnc_canUseFCS
 *
 * Public: No
 */
#include "script_component.hpp"

getNumber ([configFile >> "CfgVehicles" >> typeOf vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call EFUNC(common,getTurretConfigPath) >> QGVAR(Enabled)) == 1
&& {cameraView == "GUNNER"}
&& {
    private _animationState = animationState ACE_player;
    private _moves = configFile >> getText (configFile >> "CfgVehicles" >> (typeof ACE_player) >> "moves");

    (getNumber (_moves >> "States" >> _animationState  >> "canPullTrigger") == 0)
}
