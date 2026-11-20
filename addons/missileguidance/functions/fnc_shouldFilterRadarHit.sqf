#include "..\script_component.hpp"
/*
 * Author: tcvm, Snow(Dryden)
 * Whether a Doppler radar loses this target in ground clutter: slower along the line of sight than the Doppler filter,
 * and either the lower half of the beam reaches the ground around it or there is ground close behind it.
 * A running helicopter's rotor still gives a return now and then.
 * Chaff is checked by ace_missileguidance_fnc_checkChaff. Useful for only Doppler radar types.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Radar: the projectile, or the launcher guiding it <OBJECT>
 * 2: Minimum speed for Doppler return to filter out <NUMBER>
 * 3: Minimum time for Doppler return to filter out <NUMBER>
 * 4: Maximum distance to check for terrain <NUMBER>
 * 5: Radar seeker angle (not used) <NUMBER>
 *
 * Return Value:
 * Whether or not to filter out this target <BOOL>
 *
 * Example:
 * [cursorTarget, _projectile, 5, 0.000001, 16000] call ace_missileguidance_fnc_shouldFilterRadarHit;
 *
 * Public: Yes
 */
// as defined by lineIntersectsSurfaces
#define MAX_LINE_DISTANCE 5000

params ["_target", "_radar", "_minimumSpeed", "_minimumTime", "_maximumTerrainCheck"];
TRACE_5("should filter target",_radar,_target,_minimumSpeed,_minimumTime,_maximumTerrainCheck);
// Theory developed from doppler radar visuals at https://www.mudspike.com/dcs-f-15c-combat-guide-for-beginners/

if (isNull _target || {isNull _radar}) exitWith {false};

private _radarPos = getPosASLVisual _radar;
private _targetPos = getPosASLVisual _target;
private _lineOfSight = _radarPos vectorFromTo _targetPos;

// if relative target velocity is greater than threshold, we can easily see it. Don't filter
if (abs ((velocity _target) vectorDotProduct _lineOfSight) > _minimumSpeed) exitWith {
    TRACE_1("dont filter fast objects approaching",_minimumSpeed);
    false
};

// the lower half of the beam reaches the ground around the target
private _inClutter = (ASLToAGL _targetPos) # 2 < (_radarPos vectorDistance _targetPos) * tan RADAR_BEAM_HALF_ANGLE;

// otherwise ground close enough behind the target, as the radar sees it
if (!_inClutter) then {
    private _gateDistance = _maximumTerrainCheck min (_minimumTime * 3e8);
    private _checkPos = _targetPos;
    private _checkedDistance = 0;
    while {_checkedDistance < _gateDistance && {!_inClutter}} do {
        private _step = MAX_LINE_DISTANCE min (_gateDistance - _checkedDistance);
        private _endPos = _checkPos vectorAdd (_lineOfSight vectorMultiply _step);
        _inClutter = (lineIntersectsSurfaces [_checkPos, _endPos, _target, _radar]) isNotEqualTo [];
        _checkPos = _endPos;
        _checkedDistance = _checkedDistance + _step;
    };
};

if (!_inClutter) exitWith {
    TRACE_1("dont filter targets that we can see clear of clutter",_inClutter);
    false
};

// helicopter blades still give a doppler return now and then
!(_target isKindOf "Helicopter" && {isEngineOn _target} && {random 1 < RADAR_ROTOR_RETURN_CHANCE})
