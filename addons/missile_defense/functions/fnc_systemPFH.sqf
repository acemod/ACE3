#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Processes each missile defense system per frame.
 *
 * Arguments:
 * 0: Args <ARRAY>
 * 1: Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_missile_defense_systemPFH] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

if (GVAR(systemIndex) > count GVAR(systems) - 1) then {
    // If the system index is out of bounds, reset it to 0
    GVAR(systemIndex) = 0;
};
private _system = GVAR(systems) getOrDefault [(keys GVAR(systems)) select GVAR(systemIndex), -1];
GVAR(systemIndex) = GVAR(systemIndex) + 1;
if (_system isEqualTo -1) exitWith {
    GVAR(systemIndex) = 0;
};

// Filter out launchers and trackers that are not alive
{
    private _items = _system getOrDefault [_x, []];
    {
        if (isNull _x || !alive _x) then {
            _items deleteAt _forEachIndex;
        };
    } forEachReversed _items;
} forEach ["launchers", "trackers"];

// Move the first target from the possible targets to the pending targets for each missile defense system.
private _target = (_system getOrDefault ["targets_possible", []]) deleteAt 0;
if (!isNil "_target" && {!isNull _target}) then {
    private _sides = _system getOrDefault ["sides", []];
    private _side = _target getVariable [QGVAR(side), sideUnknown];
    if (_side in _sides) then {
        TRACE_1("Moved pending target",_target);
        (_system getOrDefault ["targets_pending", []]) pushBack _target;
    } else {
        TRACE_2("Target side not in missile defense system sides",_target,_side);
    };
};

// Check the first pending target for in range
private _target = (_system getOrDefault ["targets_pending", []]) deleteAt 0;
if (!isNil "_target" && {!isNull _target}) then {
    private _seen = false;
    {
        private _range = _x getVariable [QGVAR(range), 3000];
        if (_target distanceSqr _x <= _range * _range) exitWith {
            TRACE_2("Tracker sees target, moved to tracking",_x,_target);
            (_system getOrDefault ["targets_tracking", []]) pushBack _target;
            _seen = true;
        };
    } forEach (_system getOrDefault ["trackers", []]);
    if (!_seen) then {
        (_system getOrDefault ["targets_pending", []]) pushBack _target;
    };
};

// If able, fire at the first tracked target
private _tracked = (_system getOrDefault ["targets_tracking", []]) deleteAt 0;
if (!isNil "_tracked" && {!isNull _tracked}) then {
    private _launchers = _system getOrDefault ["launchers", []];
    private _launchers = _launchers select {
        private _state = _x getVariable [QGVAR(state), LAUNCH_STATE_IDLE];
        _state == LAUNCH_STATE_IDLE && someAmmo _x
    };
    if (count _launchers == 0) exitWith {
        TRACE_1("No launchers available to fire at tracked target",_tracked);
        _system getOrDefault ["targets_tracking", []] pushBack _tracked;
    };
    private _launcher = if (count _launchers > 1) then {
        private _bestDistance = 1e10;
        private _bestLauncher = -1;
        {
            private _distance = _x distance _tracked;
            if (_distance < _bestDistance) then {
                _bestDistance = _distance;
                _bestLauncher = _x;
            };
        } forEach _launchers;
        _bestLauncher
    } else {
        _launchers select 0
    };
    TRACE_2("Launcher selected for tracked target",_launcher,_tracked);
    _launcher setVariable [QEGVAR(missileguidance,target), _tracked];
    _launcher setVariable [QGVAR(state), LAUNCH_STATE_TRACKING];
};

// Handle firing and cooldown
{
    private _launcher = _x;
    private _state = _launcher getVariable [QGVAR(state), LAUNCH_STATE_IDLE];
    switch (_state) do {
        case LAUNCH_STATE_TRACKING: {
            private _target = _launcher getVariable [QEGVAR(missileguidance,target), objNull];
            _launcher lookAt getPosVisual _target;
            if (isNull _target) then {
                _launcher setVariable [QGVAR(state), LAUNCH_STATE_IDLE];
            } else {
                private _directionToTarget = (getPosASLVisual _launcher) vectorFromTo (getPosASLVisual _target);
                private _turretDirection = _launcher weaponDirection currentWeapon _launcher;
                private _localDirection = _launcher vectorWorldToModelVisual _turretDirection;

                private _elevation = 90 - ((_localDirection#1) atan2 (_localDirection#2));
                private _angle = acos (_turretDirection vectorCos _directionToTarget);

                if (_angle <= GVAR(launchAcceptableAngle) && _elevation >= GVAR(launchAcceptableElevation)) then {
                    _launcher setVariable [QGVAR(state), LAUNCH_STATE_COOLDOWN];
                    _launcher setVariable [QGVAR(lastLaunchTime), CBA_missionTime];
                    private _turret = [_launcher, (crew _launcher) select 0] call CBA_fnc_turretPath;
                    [_launcher, _launcher currentWeaponTurret _turret] call BIS_fnc_fire;
                    private _target = _launcher getVariable QEGVAR(missileguidance,target);
                    private _engagedTargets = _x getVariable QGVAR(engagedTargets);
                };
            };
        };
        case LAUNCH_STATE_COOLDOWN: {
            private _lastLaunchTime = _launcher getVariable QGVAR(lastLaunchTime);
            if (CBA_missionTime - _lastLaunchTime >= GVAR(timeBetweenLaunches)) then {
                _launcher setVariable [QGVAR(state), LAUNCH_STATE_IDLE];
            };
        };
    };
} forEach (_system getOrDefault ["launchers", []]);
