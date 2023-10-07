#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles tracking of incoming projectiles per frame
 *
 * Arguments:
 * 0: Args <ARRAY>
 * 1: Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_iron_dome_projectileTrackerPFH] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

GVAR(trackers) = GVAR(trackers) select {
    _x params ["_tracker", "_range"];
    #ifdef DRAW_TRACKING_INFO
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], getPos _tracker, 0.75, 0.75, 0, format ["TRACKER [%1m]", _range], 1, 0.025, "TahomaB"];
    #endif
    alive _tracker
};

GVAR(launchers) = GVAR(launchers) select {
    alive _x
};

[GVAR(toBeShot), {
    (CBA_missionTime - _value) < GVAR(targetRecycleTime)
}] call CBA_fnc_hashFilter;

private _idleLaunchers = GVAR(launchers) select {
    (_x getVariable QGVAR(launchState)) isEqualTo LAUNCH_STATE_IDLE && { someAmmo _x }
};

// no point filtering if we don't have a launcher. Don't waste cycles
if (_idleLaunchers isNotEqualTo []) then {

    GVAR(nonTrackingProjectiles) = GVAR(nonTrackingProjectiles) select {
        private _projectile = _x;
        if (isNull _projectile) then {continueWith false};

        private _keep = true;
        private _bestRange = 1e10;
        
        {
            _x params ["_tracker", "_range"];
            _bestRange = _bestRange min (_projectile distanceSqr _tracker);
            if (_projectile distanceSqr _tracker <= _range * _range) exitWith {
                GVAR(trackingProjectiles) pushBack [_projectile, 0];
                _keep = false;
                [QGVAR(projectileInRange), [_projectile, _tracker]] call CBA_fnc_localEvent;
            };
        } forEach GVAR(trackers);

        #ifdef DRAW_TRACKING_INFO
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], getPos _projectile, 0.75, 0.75, 0, format ["%1 %2m", typeOf _projectile, sqrt _bestRange], 1, 0.025, "TahomaB"];
        #endif

        _keep
    };

    GVAR(trackingProjectiles) = GVAR(trackingProjectiles) select {
        _x params ["_projectile", "_lastFired"];

        private _keep = false;
        if (alive _projectile) then {
            {
                _x params ["_tracker", "_range"];
                private _withinRange = _projectile distanceSqr _tracker <= _range * _range;

                if (_withinRange) exitWith {
                    _keep = true;
                };

            } forEach GVAR(trackers);

            if !(_keep) then {
                GVAR(nonTrackingProjectiles) pushBack _projectile;
            } else {
                private _bestLauncher = objNull;
                private _bestAmmo = 0;

                private _engagedFuture = [GVAR(toBeShot), _projectile] call CBA_fnc_hashHasKey;

                private _engagedPast = GVAR(interceptors) findIf {
                    _x params ["", "_target"];
                    _projectile isEqualTo _target;
                };

                private _engaged = _engagedFuture || (_engagedPast != -1);
                if !(_engaged) then {
                    // launch a missile
                    // pick first idle launcher. Could use a heuristic, but that would require O(k*l) operations, and that could be a lot
                    // 20 launchers * 100 projectiles = 2000 loops. Way too slow
                    private _bestLauncher = _idleLaunchers select 0;
                    _idleLaunchers deleteAt 0;

                    private _targetList = _bestLauncher getVariable QGVAR(targetList);
                    _targetList pushBackUnique _projectile;
                    _bestLauncher setVariable [QGVAR(targetList), _targetList];

                    // avoid re-engaging same target
                    [GVAR(toBeShot), _projectile, CBA_missionTime] call CBA_fnc_hashSet;
                };

                #ifdef DRAW_TRACKING_INFO
                drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], getPos _projectile, 0.75, 0.75, 0, format ["%1 %2m %3s", typeOf _projectile, _bestLauncher distance _projectile], 1, 0.025, "TahomaB"];
                #endif
            };
        };

        _keep
    };
};

{
    private _launcher = _x;
    private _state = _launcher getVariable QGVAR(launchState);

    switch (_state) do {
        case LAUNCH_STATE_IDLE: {
            private _targetList = _x getVariable QGVAR(targetList);
            private _engagedTargets = _x getVariable QGVAR(engagedTargets);

            _targetList = _targetList select {
                private _timeFiredAt = [_engagedTargets, _x, 0] call CBA_fnc_hashGet;
                alive _x && (_timeFiredAt == 0 || { (CBA_missionTime - _timeFiredAt) >= GVAR(targetRecycleTime) })
            };

            private _bestTarget = objNull;
            private _bestDistance = 1e10;
            {
                if (_x distanceSqr _launcher < _bestDistance) then {
                    _bestTarget = _x;
                    _bestDistance = _x distanceSqr _launcher;
                };
            } forEach _targetList;

            if !(isNull _bestTarget) then {
                _launcher setVariable [QEGVAR(missileguidance,target), _bestTarget];
                _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_TRACKING];
            };

            #ifdef DRAW_TRACKING_INFO
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 1, 1, 1], getPos _launcher, 0.75, 0.75, 0, format ["IDLE [AMMO: %1]", someAmmo _launcher], 1, 0.025, "TahomaB"];
            #endif
        };
        case LAUNCH_STATE_TRACKING: {
            private _target = _launcher getVariable QEGVAR(missileguidance,target);
            _launcher lookAt getPosVisual _target;

            if (isNull _target) then {
                _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_IDLE];
            } else {
                private _directionToTarget = (getPosASLVisual _launcher) vectorFromTo (getPosASLVisual _target);
                private _turretDirection = _launcher weaponDirection currentWeapon _launcher;
                private _localDirection = _launcher vectorWorldToModelVisual _turretDirection;
                
                private _elevation = 90 - ((_localDirection#1) atan2 (_localDirection#2));
                private _angle = acos (_turretDirection vectorCos _directionToTarget);

                if (_angle <= GVAR(launchAcceptableAngle) && _elevation >= GVAR(launchAcceptableElevation)) then {
                    _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_FIRING];
                };

                #ifdef DRAW_TRACKING_INFO
                drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0, 0, 1, 1], getPos _launcher, 0.75, 0.75, 0, format ["TRACKING: %1 %2", _angle, _elevation], 1, 0.025, "TahomaB"];
                drawLine3D [getPos _launcher, getPos _target, [0, 0, 1, 1]];
                #endif
            };            
        };
        case LAUNCH_STATE_FIRING: {
            private _turret = [_launcher, (crew _launcher) select 0] call CBA_fnc_turretPath;
            [_launcher, _launcher currentWeaponTurret _turret] call BIS_fnc_fire;

            _launcher setVariable [QGVAR(lastLaunchTime), CBA_missionTime];
            _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_COOLDOWN];

            private _target = _launcher getVariable QEGVAR(missileguidance,target);
            private _engagedTargets = _x getVariable QGVAR(engagedTargets);
            [_engagedTargets, _target, CBA_missionTime] call CBA_fnc_hashSet;
            _x setVariable [QGVAR(engagedTargets), _engagedTargets];

            #ifdef DRAW_TRACKING_INFO
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 0, 0, 1], getPos _launcher, 0.75, 0.75, 0, format ["FIRING"], 1, 0.025, "TahomaB"];
            #endif
        };
        case LAUNCH_STATE_COOLDOWN: {
            private _lastLaunchTime = _launcher getVariable QGVAR(lastLaunchTime);
            if (CBA_missionTime - _lastLaunchTime >= GVAR(timeBetweenLaunches)) then {
                _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_IDLE];
            };

            #ifdef DRAW_TRACKING_INFO
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0, 0, 1, 1], getPos _launcher, 0.75, 0.75, 0, format ["COOLDOWN %1", CBA_missionTime - _lastLaunchTime], 1, 0.025, "TahomaB"];
            #endif
        };
    };
} forEach GVAR(launchers);

