#include "..\script_component.hpp"
/*
 * Author: tcvm, Snow(Dryden)
 * doppler radar seeker
 * Ground clutter and chaff are checked at the radar poll rate: by the launcher's radar while it guides the missile,
 * then by the missile's own seeker. Chaff it takes for the target seduces the missile for RADAR_CHAFF_SEDUCE_TIME,
 * after which the radar searches for its target again. Low over the ground and slow along the line of sight, the
 * target's reflection pulls the aim below it (multipath).
 *
 * Arguments:
 * 0: Seeker Target PosASL, always [0, 0, 0] (not used) <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 * 3: Last Known Pos State (not used) <ARRAY>
 * 4: Timestep <NUMBER>
 *
 * Return Value:
 * Seeker Pos <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_Doppler;
 *
 * Public: No
 */
params ["", "_args", "_seekerStateParams", "", "_timestep"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["_target","","","",""];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];
_seekerStateParams params ["_isActive", "_activeRadarEngageDistance", "_timeWhenActive", "_expectedTargetPos", "_lastTargetPollTime", "_shooterHasRadar", "_wasActive", "_lastKnownVelocity", "_lastTimeSeen", "_doesntHaveTarget", "_lockTypes", "_minimumFilterSpeed", "_minimumFilterTime", "_maxTerrainCheck", "_seducedUntil", "_externalLost", "_seducedFrom", "_chaffEffectiveness", "_multipathError", "_multipathMaxSpeed", "_multipathMaxHeight", "_multipathPhase"];

private _isProjectile = { !isNull _this && { (typeOf _this) isKindOf ["Default", configFile >> "CfgAmmo"] } };
private _isActiveNow = _isActive || { CBA_missionTime >= _timeWhenActive };

// chaff seduction over: the radar searches again, finding its target if it's in the seeker's cone, in sight and out of
// clutter, otherwise the seeker searches around the chaff
if (_seducedUntil >= 0 && { CBA_missionTime >= _seducedUntil || { !alive _target } }) then {
    if (alive _target) then {
        _expectedTargetPos = getPosASLVisual _target;
    };
    private _found = alive _seducedFrom && { !_isActiveNow || {
        [_projectile, getPosASLVisual _seducedFrom, _seekerAngle] call FUNC(checkSeekerAngle) && {
            ([_projectile, _seducedFrom, true] call FUNC(checkLos)) || { ([_projectile, _seducedFrom, false] call FUNC(checkLos)) }
        } && {
            !([_seducedFrom, _projectile, _minimumFilterSpeed, _minimumFilterTime, _maxTerrainCheck] call FUNC(shouldFilterRadarHit))
        }
    } };
    _target = [objNull, _seducedFrom] select _found;
    if (_found) then {
        _expectedTargetPos = getPosASLVisual _target;
    } else {
        _projectile setMissileTarget objNull;
    };
    _doesntHaveTarget = false;
    _seekerStateParams set [9, false];
    _seekerStateParams set [14, -1];
    _seekerStateParams set [16, objNull];
};

if (_isActiveNow) then {
    if !(_isActive) then {
        _seekerStateParams set [0, true];
    };
    if !(_wasActive) then {
        _seekerStateParams set [6, true];
        TRACE_1("Missile Pitbull",_seekerStateParams);
    };
    _externalLost = false;
    _seekerStateParams set [15, false];

    // if we are tracking a projectile, don't bother with radar crap just fly to it
    if !(_target call _isProjectile) then {
        // Internal radar homing
        // For performance reasons only poll for target every so often instead of each frame
        if ((_lastTargetPollTime + ACTIVE_RADAR_POLL_FREQUENCY) - CBA_missionTime < 0) then {
            private _searchPos = _expectedTargetPos;
            if (_searchPos isEqualTo [0, 0, 0] || { _doesntHaveTarget }) then {
                _seekerStateParams set [9, true];
                // no target pos - shot without lock. Have the missile's radar search infront of it on the ground
                _searchPos = (getPosASL _projectile) vectorAdd (_projectile vectorModelToWorld [0, _seekerMaxRange, -((getPos _projectile)#2)]);
            };

            _target = objNull;
            _lastTargetPollTime = CBA_missionTime;
            _seekerStateParams set [4, _lastTargetPollTime];
            private _distanceToExpectedTarget = _seekerMaxRange min ((getPosASL _projectile) vectorDistance _searchPos);

            // Simulate how much the seeker can see at the ground
            private _projDir = vectorDir _projectile;
            private _projYaw = getDir _projectile;
            private _rotatedYaw = (+(_projDir select 0) * sin _projYaw) + (+(_projDir select 1) * cos _projYaw);
            if (_rotatedYaw isEqualTo 0) then { _rotatedYaw = 0.001 };
            private _projPitch = atan ((_projDir select 2) / _rotatedYaw);
            private _a1 = abs _projPitch;
            private _a2 = 180 - ((_seekerAngle / 2) + _a1);
            private _seekerBaseRadiusAtGround = ACTIVE_RADAR_MINIMUM_SCAN_AREA max (_distanceToExpectedTarget / sin(_a2) * sin(_seekerAngle / 2));

            private _seekerBaseRadiusAdjusted = linearConversion [0, _seekerBaseRadiusAtGround, (CBA_missionTime - _lastTimeSeen) * vectorMagnitude _lastKnownVelocity, ACTIVE_RADAR_MINIMUM_SCAN_AREA, _seekerBaseRadiusAtGround, false];
            if (_doesntHaveTarget) then {
                _seekerBaseRadiusAdjusted = _seekerBaseRadiusAtGround;
            };
            // Look in front of seeker for any targets
            private _nearestObjects = nearestObjects [ASLToAGL _searchPos, _lockTypes, _seekerBaseRadiusAdjusted, false];
            _nearestObjects = _nearestObjects select {
                // If target within angle AND we can see target AND we shouldn't filter target, then target is a candidate
                [_projectile, getPosASL _x, _seekerAngle] call FUNC(checkSeekerAngle) && {
                    // I check both Line of Sight versions to make sure that a single bush doesn't make the target lock disappear but at the same
                    // time ensure that this can see through smoke
                    ([_projectile, _x, true] call FUNC(checkLos)) || { ([_projectile, _x, false] call FUNC(checkLos)) }
                } && {
                    !([_x, _projectile, _minimumFilterSpeed, _minimumFilterTime, _maxTerrainCheck, _seekerAngle] call FUNC(shouldFilterRadarHit))
                }
            };
            // Select closest object to the expected position to be the current radar target
            if (_nearestObjects isEqualTo []) exitWith {
                _projectile setMissileTarget objNull;
                _seekerStateParams set [3, _searchPos];
                _searchPos
            };
            private _closestDistance = _seekerBaseRadiusAtGround;
            {
                if ((_x distance2D _searchPos) < _closestDistance) then {
                    _closestDistance = _x distance2D _searchPos;
                    _target = _x;
                };
            } forEach _nearestObjects;

            _expectedTargetPos = _searchPos;

            // chaff near the target may take the seeker off it
            if (!isNull _target) then {
                private _chaff = [_target, _projectile, _minimumFilterSpeed, _seekerAngle, false, _chaffEffectiveness] call FUNC(checkChaff);
                if (!isNull _chaff) then {
                    _seekerStateParams set [14, CBA_missionTime + RADAR_CHAFF_SEDUCE_TIME];
                    _seekerStateParams set [16, _target];
                    _target = _chaff;
                };
            };
        };
    };
} else {
    if (GVAR(debug_drawGuidanceInfo)) then {
        _seekerTypeName = "DOPPLER - EXT"; //IGNORE_PRIVATE_WARNING ["_seekerTypeName"]; // from doSeekerSearch
    };
    // External radar homing
    // if the target is in the remote targets for the side, whoever the donor is will "datalink" the target for the hellfire.
    // not while the launcher's radar is seduced by chaff, which the datalink doesn't have
    private _remoteTargets = listRemoteTargets side _shooter;
    if ((_seekerStateParams select 14) < 0 && { (_remoteTargets findIf { (_target in _x) && (_x#1 > 0) }) == -1 }) then {
        // I check both Line of Sight versions to make sure that a single bush doesn't make the target lock disappear but at the same time ensure that this can see through smoke. Should work 80% of the time
        private _vehicle = vehicle _shooter;
        if (!_shooterHasRadar || { !isVehicleRadarOn _vehicle } || { !alive _vehicle } || { !([_vehicle, _target, true] call FUNC(checkLOS)) && { !([_vehicle, _target, false] call FUNC(checkLOS)) } }) then {
            _seekerStateParams set [0, true];
            _target = objNull; // set up state for active guidance
        };
    };

    // the launcher's radar loses the target in ground clutter, or takes chaff for it, as the seeker would
    if (!isNull _target && { !(_target call _isProjectile) } && { (_lastTargetPollTime + ACTIVE_RADAR_POLL_FREQUENCY) - CBA_missionTime < 0 }) then {
        _seekerStateParams set [4, CBA_missionTime];
        private _radar = vehicle _shooter;
        _externalLost = [_target, _radar, _minimumFilterSpeed, _minimumFilterTime, _maxTerrainCheck] call FUNC(shouldFilterRadarHit);
        _seekerStateParams set [15, _externalLost];
        if (!_externalLost) then {
            private _chaff = [_target, _radar, _minimumFilterSpeed, -1, false, _chaffEffectiveness] call FUNC(checkChaff);
            if (!isNull _chaff) then {
                _seekerStateParams set [14, CBA_missionTime + RADAR_CHAFF_SEDUCE_TIME];
                _seekerStateParams set [16, _target];
                _target = _chaff;
            };
        };
    };
};

if (GVAR(debug_drawGuidanceInfo)) then {
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL _expectedTargetPos, 0.75, 0.75, 0, "expected target pos", 1, 0.025, "TahomaB"];
    if ((_seekerStateParams select 14) >= 0 && { _target call _isProjectile }) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLToAGL getPosASLVisual _target, 0.75, 0.75, 0, "chaff", 1, 0.025, "TahomaB"];
    };
    if (_externalLost) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], ASLToAGL _expectedTargetPos, 0.75, 0.75, 0, "lost in clutter", 1, 0.025, "TahomaB"];
    };
    // chaff near the real target, as the radar now looking sees it
    private _realTarget = [_target, _seekerStateParams select 16] select ((_seekerStateParams select 14) >= 0);
    if (!isNull _realTarget && { !(_realTarget call _isProjectile) }) then {
        private _seekerActive = _seekerStateParams select 0;
        [_realTarget, [vehicle _shooter, _projectile] select _seekerActive, _minimumFilterSpeed, [-1, _seekerAngle] select _seekerActive, true, _chaffEffectiveness] call FUNC(checkChaff);
    };
};

if !(isNull _target) then {
    // while the launcher's radar has lost the target, keep flying at where it was last seen
    if !(_externalLost) then {
        // we check if the target is moving away from us or perpendicular to see if we maintain lock
        private _centerOfObject = getCenterOfMass _target;
        private _targetAdjustedPos = _target modelToWorldVisualWorld _centerOfObject;
        _expectedTargetPos = _targetAdjustedPos;

        private _lineOfSight = vectorDirVisual _projectile;
        private _realTargetVelocity = velocity _target;
        private _projectedTargetVelocity = _lineOfSight vectorMultiply (_realTargetVelocity vectorDotProduct _lineOfSight);
        private _relativeTargetVelocity = _realTargetVelocity vectorDiff _projectedTargetVelocity;

        // following chaff steers the missile, but isn't a sighting of the target
        private _seduced = (_seekerStateParams select 14) >= 0;
        if (!_seduced) then {
            _seekerStateParams set [7, _relativeTargetVelocity];
            _seekerStateParams set [8, CBA_missionTime];
            _seekerStateParams set [9, false];
        };

        _targetData set [2, _projectile distance _target];
        _targetData set [3, _relativeTargetVelocity];

        if (_timestep != 0) then {
            private _acceleration = [(_relativeTargetVelocity vectorDiff _lastKnownVelocity) vectorMultiply (1 / _timestep), [0, 0, 0]] select _seduced;
            _targetData set [4, _acceleration];
        };
    };
    _projectile setMissileTarget _target;
};

if (_expectedTargetPos isEqualTo [0, 0, 0]) then {
    _expectedTargetPos = (getPosASLVisual _projectile) vectorAdd velocity _projectile;
};

// low over the ground and slow along the line of sight, the radar also sees the target's reflection and aims below it
private _aimPos = _expectedTargetPos;
if (!isNull _target && { !_externalLost } && { _multipathError > 0 } && { !(_target call _isProjectile) }) then {
    private _radar = [vehicle _shooter, _projectile] select (_seekerStateParams select 0);
    private _radialSpeed = abs ((velocity _target) vectorDotProduct ((getPosASLVisual _radar) vectorFromTo _expectedTargetPos));
    private _error = _multipathError * linearConversion [0, _multipathMaxHeight, (ASLToAGL _expectedTargetPos) select 2, 1, 0, true] * linearConversion [0, _multipathMaxSpeed, _radialSpeed, 1, 0, true];
    if (_error <= 0) exitWith {};
    // wanders between the target and the full error below it
    _aimPos = _expectedTargetPos vectorAdd [0, 0, -_error * (1 + sin (CBA_missionTime * RADAR_MULTIPATH_RATE + _multipathPhase)) / 2];
    if (GVAR(debug_drawGuidanceInfo)) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.5,0,1], ASLToAGL _aimPos, 0.75, 0.75, 0, "multipath aim", 1, 0.025, "TahomaB"];
    };
};

_targetData set [0, (getPosASLVisual _projectile) vectorFromTo _aimPos];

_seekerStateParams set [3, _expectedTargetPos];
_launchParams set [0, _target];
_aimPos
