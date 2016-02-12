/*
 * Author: esteldunedain
 * Maintains the tracked lasers, deleting any laser that is turned off
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["", "_pfhuid"];

TRACE_1("pfh", GVAR(trackedLaserTargets));
GVAR(trackedLaserTargets) = GVAR(trackedLaserTargets) select {
    _x params ["_targetObject", "_owner", "_laserUuid"];
    if ((isNull _targetObject) ||
        {!(alive _targetObject)} ||
        {isNull _owner} ||
        {!(alive _owner)}) then {

        // Turn off the laser in ace_laser
        [_laserUuid] call EFUNC(laser,laserOff);
        TRACE_1("Laser off:", _laserUuid);
        false
    } else {
        true
    };
};

if (GVAR(trackedLaserTargets) isEqualTo []) then {
    [_pfhuid] call CBA_fnc_removePerFrameHandler;
    GVAR(pfhuid) = nil;
};
