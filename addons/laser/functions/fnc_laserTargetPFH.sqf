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

#ifdef DEBUG_MODE_FULL
{
    _x params ["_targetObject", "_owner", "_laserUuid"];

    // Iconize the location of the actual laserTarget
    private _pos = getPosASL _targetObject;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _pos), 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
} forEach GVAR(trackedLaserTargets);
#endif

if (GVAR(trackedLaserTargets) isEqualTo []) then {
    TRACE_1("ending pfeh",count GVAR(trackedLaserTargets));
    [_pfhuid] call CBA_fnc_removePerFrameHandler;
    GVAR(pfehID) = -1;
};
