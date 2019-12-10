#include "script_component.hpp"
/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with checkVisibility
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Has LOS <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_missileguidance_fnc_checkLOS;
 *
 * Public: No
 */

params ["_seeker", "_target"];

private _visibility = [_seeker, "VIEW", _target] checkVisibility [getPosASL _seeker, aimPos _target];
_visibility > 0.001
