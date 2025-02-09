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

private _position = _target selectionPosition "spine3";
(((_target selectionPosition "rightshoulder" vectorDiff _position) vectorCrossProduct (_target selectionPosition "leftshoulder" vectorDiff _position)) vectorMultiply 4) vectorAdd _position;
