#include "script_component.hpp"
/*
 * Author: commy2
 * Attempt to fix PhysX collisions causing unreasonable impact forces and damage.
 *
 * Arguments:
 * Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_fixCollision
 *
 * Public: No
 */

// allowDamage requires local object
if (!local _this) exitWith {};

// prevent collision damage
[_this, "blockDamage", "fixCollision", true] call FUNC(statusEffect_set);

// re-allow damage after 2 seconds
[{[_this, "blockDamage", "fixCollision", false] call FUNC(statusEffect_set);}, _this, 2] call CBA_fnc_waitAndExecute;
