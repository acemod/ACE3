#include "script_component.hpp"
/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with checkVisibility
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target <OBJECT>
 * 2: Whether or not to use checkVisibility to test for LOS <BOOLEAN>
 *
 * Return Value:
 * Has LOS <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_missileguidance_fnc_checkLOS;
 *
 * Public: No
 */

params ["_projectile", "_fuzeMisc"];
_fuzeMisc params ["_enabled", "_vehicleCheckRange", "_groundCheckRange"];

if(!(_enabled)) exitWith {false};

_projPos = getPos _projectile;
if((_projPos) nearObjects ["Any", _vehicleCheckRange]) exitWith {true};

if((_projPos select 2) < _groundCheckRange) exitWith {true};

false;
