#include "script_component.hpp"
/*
 * Author: TCVM
 * An action for the player to get in the CSW
 * Due to the fact that the default static weapons "Get In" memory point is at the front of
 * the gun and can't be acssesed from the back, I am implementing this to get around that issue.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_getIn
 *
 * Public: No
 */

params ["_staticWeapon", "_player"];
TRACE_2("getIn",_staticWeapon,_player);

_player moveInTurret [_staticWeapon, [0]];
