/*
 * Author: ?
 * This Function Log Every Laser Emitter
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_laser_fnc_drawVisibleLaserTargets
 *
 * Public: No
 */
#include "script_component.hpp"
diag_log text format["[ACE]: Laser Emitter Dump"];

{
    diag_log text format["  %1", _x];
    diag_log text format["    %2", HASH_GET(GVAR(laserEmitters), _x)];
} forEach GVAR(laserEmitters) select 0;
