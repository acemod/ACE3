#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Process laser fired events. Doesn't run per-frame, but rather on a delay.
 * Requires `ace_laser`. Only initialised if we can guarantee module loaded.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [{ call ace_laser_warning_fnc_pfh_processLases }, 0.1] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

{
    _y params [];
} forEach EGVAR(laser,laserEmitters);