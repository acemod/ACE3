#include "..\script_component.hpp"
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

// Prevent collision damage
[_this, QGVAR(blockDamage), "fixCollision", true] call FUNC(statusEffect_set);

// Re-allow damage after 2 seconds
[{[_this, QGVAR(blockDamage), "fixCollision", false] call FUNC(statusEffect_set);}, _this, 2] call CBA_fnc_waitAndExecute;
