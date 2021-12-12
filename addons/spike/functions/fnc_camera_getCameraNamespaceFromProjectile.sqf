#include "script_component.hpp"
/*
  * Author: Brandon (TCVM)
 * Switches away from the currently controlled camera
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_projectile"];

[GVAR(projectileCameraHash), {
    !((isNil "_key") || { isNull _key })
}] call CBA_fnc_hashFilter;
[GVAR(projectileCameraHash), _projectile] call CBA_fnc_hashGet;

