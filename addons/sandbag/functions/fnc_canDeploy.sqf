/*
 * Author: Ruthberg
 * Checks if the player can deploy a sandbag
 *
 * Arguments:
 * None
 *
 * Return Value:
 * can deploy? <BOOLEAN>
 *
 * Example:
 * call ace_sandbag_fnc_canDeploy;
 *
 * Public: No
 */
#include "script_component.hpp"

(([ACE_player, "ACE_Sandbag_empty"] call EFUNC(common,hasItem)) && !(ACE_player getVariable [QGVAR(usingSandbag), false]))
