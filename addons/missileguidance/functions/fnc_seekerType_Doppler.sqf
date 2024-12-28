#include "..\script_component.hpp"
/*
 * Author: tcvm
 * doppler radar seeker
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Seeker Pos <ARRAY>
 *
 * Example:
 * [] call call ace_missileguidance_fnc_seekerType_Doppler;
 *
 * Public: No
 */
params ["", "_args", "_seekerStateParams", "", "_timestep"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["_target","","","",""];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];
_seekerStateParams params ["_isActive", "_activeRadarEngageDistance", "_timeWhenActive", "_expectedTargetPos", "_lastTargetPollTime", "_shooterHasRadar", "_wasActive", "_lastKnownVelocity", "_lastTimeSeen", "_doesntHaveTarget", "_lockTypes", "_minimumFilterSpeed", "_minimumFilterTime", "_maxTerrainCheck"];

if (_isActive || { CBA_missionTime >= _timeWhenActive }) then {
    if !(_isActive) then {
        _seekerStateParams set [0, true];
    };
    if !(_wasActive) then {
        _seekerStateParams set [6, true];
        TRACE_1("Missile Pitbull",_seekerStateParams);
    };

    // if we are tracking a projectile, don't bother with radar crap just fly to it
    if (isNull _target || { !((typeOf _target) isKindOf ["Default", configFile >> "CfgAmmo"]) }) then {
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
                    // I check both Line of Sight versions to make sure that a single bush doesnt make the target lock dissapear but at the same
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
        };
    };
} else {
    if (GVAR(debug_drawGuidanceInfo)) then {
        _seekerTypeName = "DOPPLER - EXT"; //IGNORE_PRIVATE_WARNING ["_seekerTypeName"]; // from doSeekerSearch
    };
    // External radar homing
    // if the target is in the remote targets for the side, whoever the donor is will "datalink" the target for the hellfire.
    private _remoteTargets = listRemoteTargets side _shooter;
    if ((_remoteTargets findIf { (_target in _x) && (_x#1 > 0) }) == -1) then {
        // I check both Line of Sight versions to make sure that a single bush doesnt make the target lock dissapear but at the same time ensure that this can see through smoke. Should work 80% of the time
        private _vehicle = vehicle _shooter;
        if (!_shooterHasRadar || { !isVehicleRadarOn _vehicle } || { !alive _vehicle } || { !([_vehicle, _target, true] call FUNC(checkLOS)) && { !([_vehicle, _target, false] call FUNC(checkLOS)) } }) then {
            _seekerStateParams set [0, true];
            _target = objNull; // set up state for active guidance
        };
    };
};

if (GVAR(debug_drawGuidanceInfo)) then {
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL _expectedTargetPos, 0.75, 0.75, 0, "expected target pos", 1, 0.025, "TahomaB"];
};

if !(isNull _target) then {
    // we check if the target is moving away from us or perpendicular to see if we maintain lock
    private _centerOfObject = getCenterOfMass _target;
    private _targetAdjustedPos = _target modelToWorldVisualWorld _centerOfObject;
    _expectedTargetPos = _targetAdjustedPos;

    if ([_target, _projectile, _minimumFilterSpeed, _minimumFilterTime, _maxTerrainCheck, _seekerAngle] call FUNC(shouldFilterRadarHit)) then {
        // filter out target
        _target = objNull;
        _seekerStateParams set [9, true];
    } else {
        private _lineOfSight = vectorDirVisual _projectile;
        private _realTargetVelocity = velocity _target;
        private _projectedTargetVelocity = _lineOfSight vectorMultiply (_realTargetVelocity vectorDotProduct _lineOfSight);
        private _relativeTargetVelocity = _realTargetVelocity vectorDiff _projectedTargetVelocity;

        _seekerStateParams set [7, _relativeTargetVelocity];
        _seekerStateParams set [8, CBA_missionTime];
        _seekerStateParams set [9, false];

        _targetData set [2, _projectile distance _target];
        _targetData set [3, _relativeTargetVelocity];

        if (_timestep != 0) then {
            private _acceleration = (_relativeTargetVelocity vectorDiff _lastKnownVelocity) vectorMultiply (1 / _timestep);
            _targetData set [4, _acceleration];
        };
    };
    _projectile setMissileTarget _target;
};

if (_expectedTargetPos isEqualTo [0, 0, 0]) then {
    _expectedTargetPos = (getPosASLVisual _projectile) vectorAdd velocity _projectile;
};

_targetData set [0, (getPosASLVisual _projectile) vectorFromTo _expectedTargetPos];

_seekerStateParams set [3, _expectedTargetPos];
_launchParams set [0, _target];
_expectedTargetPos
