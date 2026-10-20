#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if the unit can interact with a civilian.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Able to interact with civilian <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_interaction_fnc_canInteractWithCivilian
 *
 * Public: No
 */

params ["_unit", "_target"];

_target call EFUNC(common,isAwake) && {side group _target == civilian} // return
