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
 * Public: No
 */
#include "script_component.hpp"

// allowDamage requires local object
if (!local _this) exitWith {};

// prevent collision damage, @todo allowDamage API
[_this, "fixCollision", 1] call FUNC(setAllowDamage);

// re-allow damage after 2 seconds
[{
    [_this, "fixCollision", 0] call FUNC(setAllowDamage);
}, _this, 2] call EFUNC(common,waitAndExecute);
