#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Return a suitable position for the action point for the target's backpack.
 *
 * Arguments:
 * None (uses local variable _target)
 *
 * Return Value:
 * Position of _target's backpack in model space <ARRAY>
 *
 * Example:
 * call ace_interaction_fnc_getBackpackPos
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_target"];

private _position = _target selectionPosition ["spine3", "Memory"];
_position = _position vectorAdd [0, -0.2, 0.05];
_position
