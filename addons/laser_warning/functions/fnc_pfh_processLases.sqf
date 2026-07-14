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
    _y params ["", "", "_laserMethod"];
    if (_method isEqualType {} && { _method isNotEqualTo EFUNC(laser,findLaserSource) }) exitWith {};
    if (_method isEqualType "" && { _method != QEFUNC(laser,findLaserSource) }) exitWith {};
    (_y call EFUNC(laser,findLaserSource)) params ["_laserPosASL", "_laserDirection"];
    [_laserPosASL, _laserDirection] call FUNC(newLaser);
} forEach EGVAR(laser,laserEmitters);

