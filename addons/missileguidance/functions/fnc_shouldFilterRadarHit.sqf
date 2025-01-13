#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Whether or not we should filter out this target due to masking. Useful for only doppler radar types
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Projectile <OBJECT>
 * 2: Minimum speed for doppler return to filter out <NUMBER>
 * 3: Minimum time for doppler return to filter out <NUMBER>
 * 4: Maximum distance to check for terrain <NUMBER>
 * 5: Radar seeker angle <NUMBER>
 *
 * Return Value:
 * Whether or not to filter out this target <BOOL>
 *
 * Example:
 * [] call call ace_missileguidance_fnc_shouldFilterRadarHit;
 *
 * Public: Yes
 */
// as defined by lineIntersectsSurfaces
#define MAX_LINE_DISTANCE 5000

params ["_target", "_projectile", "_minimumSpeed", "_minimumTime", "_maximumTerrainCheck", "_seekerAngle"];
TRACE_5("should filter target",_projectile,_target,_minimumSpeed,_minimumTime,_maximumTerrainCheck);
// Theory developed from doppler radar visuals at https://www.mudspike.com/dcs-f-15c-combat-guide-for-beginners/

// helicopter blades will always produce a doppler shift due to their nature. Don't filter
if (_target isKindOf "Helicopter" && isEngineOn _target) exitWith {
    TRACE_1("dont filter helicopters",_target);
    false
};

private _lineOfSight = (getPosASLVisual _projectile) vectorFromTo (getPosASLVisual _target);
private _realTargetVelocity = velocity _target;
private _closingVelocity = _lineOfSight vectorMultiply (_realTargetVelocity vectorDotProduct _lineOfSight);
private _closingSpeed = vectorMagnitude _closingVelocity;

// if relative target velocity is greather than threshold, we can easily see it. Don't filter
if (_closingSpeed > _minimumSpeed) exitWith {
    TRACE_2("dont filter fast objects approaching",_closingSpeed,_minimumSpeed);
    false
};

private _projectilePos = getPosASLVisual _projectile;

private _stepDistance = _lineOfSight vectorMultiply (MAX_LINE_DISTANCE min _maximumTerrainCheck);

private _checkPos = _projectilePos;
private _maskedByGround = false;

// Check for all surfaces until we reach our max range
for "_i" from 0 to _maximumTerrainCheck step MAX_LINE_DISTANCE do {
    // determine if target is masked by ground
    private _endPos = _checkPos vectorAdd _stepDistance;
    private _groundHit = lineIntersectsSurfaces [_checkPos, _endPos, _projectile, _target];

    _maskedByGround = _groundHit isNotEqualTo [];

    _checkPos = _endPos;

    if (_maskedByGround || (_checkPos select 2) <= 0) then {
        // for ease assume that we can't check underwater
        if ((_checkPos select 2) < 0) then {
            _checkPos set [2, 0];
        };
        break
    };
};

// looking at sky, target is clear as day. Check for chaff before filtering
if !(_maskedByGround) exitWith {
    TRACE_1("dont filter stuff in the sky",_maskedByGround);

    // If there is chaff nearby, check if they will confuse missile
    private _nearby = _target nearObjects 50;
    _nearby = _nearby select {
        // 8 = radar blocking
        (([getNumber (configOf _x >> "weaponLockSystem"), 4] call EFUNC(common,binarizeNumber)) select 3) && // Check if chaff can break radar lock
        {[_projectile, getPosASLVisual _x, _seekerAngle] call FUNC(checkSeekerAngle)} && // Check if within view
        {[_projectile, _x, false] call FUNC(checkLos)} // Check if can be seen
    };

    private _foundDecoy = false;
    {
        private _considering = false;
        if !(_foundDecoy) then {
            _considering = true;
            if (0.95 <= random 1) then {
                _foundDecoy = true;
            };
        };

        if (GVAR(debug_drawGuidanceInfo)) then {
            private _chaffPos = ASLToAGL getPosASLVisual _x;
            private _colour = [1, 0, 0, 1];
            if (_considering) then {
                _colour = [0, 1, 0, 1];
            };
            if (_foundDecoy) then {
                _colour = [0, 0, 1, 1];
            };
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", _colour, _chaffPos, 0.75, 0.75, 0, "C", 1, 0.025, "TahomaB"];
        };
    } forEach _nearby;

    _foundDecoy
};

private _distanceToTerrain = _checkPos vectorDistance _projectilePos;
private _checkTime = _distanceToTerrain / 3e8;

// Time to ground is large enough to know if we are looking at a target, don't filter
if (_checkTime > _minimumTime) exitWith {
    TRACE_2("dont filter targets that we can see in ground clutter",_checkTime,_minimumTime);
    false
};

// filter out the target since we can't reasonably see it
true

