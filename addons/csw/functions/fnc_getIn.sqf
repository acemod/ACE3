/*
 * Author: TCVM
 * An action for the player to get in the CSW
 * Due to the fact that the default static weapons "Get In" memory point is at the front of
 * the gun and can't be acssesed from the back, I am implementing this to get around that issue.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, weapon] call ace_csw_fnc_getIn
 *
 * Public: No
 */
#include "script_component.hpp"

params["_player", "_weapon"];

(_player select 1) moveInTurret [_weapon, [0]];

