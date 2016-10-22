/*
 * Author: esteldunedain
 * Maintains the tracked lasers, deleting any laser that is turned off
 *
 * Argument:
 * PFEH Args
 *
 * Return value:
 * None
 *
 * Example:
 * [[], 1]] call ace_laser_fnc_laserTargetPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_pfhuid"];

GVAR(trackedLaserTargets) = GVAR(trackedLaserTargets) select {
    _x params ["_targetObject", "_owner", "_laserUuid"];
    if ((isNull _targetObject) ||
            {!(alive _targetObject)} ||
            {isNull _owner} ||
            {!(alive _owner)}) then {

        // Turn off the laser in ace_laser
        [_laserUuid] call FUNC(laserOff);
        TRACE_1("Laser off:", _laserUuid);
        false
    } else {
        true
    };
};

if (GVAR(trackedLaserTargets) isEqualTo []) then {
    TRACE_1("ending pfeh",count GVAR(trackedLaserTargets));
    [_pfhuid] call CBA_fnc_removePerFrameHandler;
    GVAR(pfehID) = -1;
};
