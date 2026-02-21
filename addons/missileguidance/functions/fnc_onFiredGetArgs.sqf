#include "..\script_component.hpp"
/*
 * Author: jaynus, nou, TCVM, PabstMirror
 * Gets guidance args for a fired missile, running fired EHs and returning the full guidance arg array
 *
 * Arguments:
 * 0: Shooter (Man/Vehicle) <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle (not used) <STRING>
 * 3: Mode <STRING>
 * 4: Ammo (in the future) <STRING>
 * 5: Magazine (not used) <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * [player, "", "", "", "ACE_Javelin_FGM148", "", theMissile] call ace_missileguidance_fnc_onFiredGetArgs
 *
 * Public: No
 */

params ["_shooter", "_weapon", "", "_mode", "_ammo", "", "_projectile"];

// MissileGuidance is enabled for this shot
TRACE_4("enabled",_shooter,_ammo,_projectile,typeOf _shooter);

private _config = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);

private _target = _shooter getVariable [QGVAR(target), nil];
private _targetPos = _shooter getVariable [QGVAR(targetPosition), nil];
private _seekerType = _shooter getVariable [QGVAR(seekerType), nil];
private _attackProfile = _shooter getVariable [QGVAR(attackProfile), nil];
private _navigationType = _shooter getVariable [QGVAR(navigationType), nil];
if ((getNumber (_config >> "useModeForAttackProfile")) == 1) then {
    _attackProfile = getText (configFile >> "CfgWeapons" >> _weapon >> _mode >> QGVAR(attackProfile))
};
private _lockMode = _shooter getVariable [QGVAR(lockMode), nil];

private _laserCode = _shooter getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _laserInfo = [_laserCode, ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH];

TRACE_7("onFiredGetArgs",_target,_targetPos,_seekerType,_attackProfile,_lockMode,_laserCode,_navigationType);

private _launchPos = getPosASL (vehicle _shooter);

if (isNil "_seekerType" || {!(_seekerType in (getArray (_config >> "seekerTypes")))}) then {
    _seekerType = getText (_config >> "defaultSeekerType");
};
if (isNil "_attackProfile" || {!(_attackProfile in (getArray (_config >> "attackProfiles")))}) then {
    _attackProfile = getText (_config >> "defaultAttackProfile");
};
if (isNil "_lockMode" || {!(_lockMode in (getArray (_config >> "seekerLockModes")))}) then {
    _lockMode = getText (_config >> "defaultSeekerLockMode");
};
if (isNil "_navigationType" || {!(_navigationType in (getArray (_config >> "navigationTypes")))}) then {
    _navigationType = getText (_config >> "defaultNavigationType");
};

if (isNil "_navigationType" || _navigationType isEqualTo "") then {
    // most missiles use ProNav by default
    _navigationType = "ProportionalNavigation";
};

// If we didn't get a target, try to fall back on tab locking
if (isNil "_target") then {
    if (!isPlayer _shooter) then {
        // This was an AI shot, lets still guide it on the AI target
        _target = _shooter getVariable [QGVAR(vanilla_target), nil];
        TRACE_1("Detected AI Shooter!",_target);
    } else {
        private _canUseLock = getNumber (_config >> "canVanillaLock");
        // @TODO: Get vanilla target
        if (_canUseLock > 0 || difficulty < 1) then {
            private _vanillaTarget = missileTarget _projectile;

            TRACE_1("Using Vanilla Locking",_vanillaTarget);
            if (!isNil "_vanillaTarget") then {
                _target = _vanillaTarget;
            };
        };
    };
};
_targetPos = getPosASLVisual _target;

// Array for seek last target position
private _seekLastTargetPos = (getNumber ( _config >> "seekLastTargetPos")) == 1;
private _lastKnownPosState = [_seekLastTargetPos];
if (_seekLastTargetPos && {!isNil "_target"}) then {
    _lastKnownPosState set [1, (getPosASL _target)];
} else {
    _lastKnownPosState set [1, [0,0,0]];
};

private _navigationParameters = [
    // set up in navigation type onFired function
];

// default config values to make sure there is backwards compat
private _pitchRate = 30;
private _yawRate = 30;
private _bangBang = false;
if (isNumber (_config >> "pitchRate")) then {
    _pitchRate = getNumber ( _config >> "pitchRate" );
    _yawRate = getNumber ( _config >> "yawRate" );
    _bangBang = (1 == getNumber (_config >> "bangBangGuidance"));
};

// How much this projectile likes to stay toward current velocity
private _stabilityCoefficient = getNumber (_config >> "stabilityCoefficient");

// show a light trail in flight
private _showTrail = (1 == getNumber (_config >> "showTrail"));

private _navigationStateSubclass = _config >> "navigationStates";
private _states = getArray (_navigationStateSubclass >> "states");

private _navigationStateData = [];

if (_states isNotEqualTo []) then {
    {
        private _stateClass = _navigationStateSubclass >> _x;
        _navigationStateData pushBack [
            getText (_stateClass >> "transitionCondition"),
            getText (_stateClass >> "navigationType"),
            []
        ];
    } forEach _states;
};

private _initialRoll = getNumber (_config >> "initialRoll");
private _initialYaw = getNumber (_config >> "initialYaw");
private _initialPitch = getNumber (_config >> "initialPitch");

private _yawRollPitch = (vectorDir _projectile) call CBA_fnc_vect2Polar;

TRACE_5("Beginning ACE guidance system",_target,_ammo,_seekerType,_attackProfile,_navigationType);
private _args = [_this,
            [   _shooter,
                [_target, _targetPos, _launchPos, vectorDirVisual vehicle _shooter, CBA_missionTime],
                _seekerType,
                _attackProfile,
                _lockMode,
                _laserInfo,
                _navigationType
            ],
            [
                _pitchRate,
                _yawRate,
                _bangBang,
                _stabilityCoefficient,
                _showTrail
            ],
            [
                getNumber ( _config >> "seekerAngle" ),
                getNumber ( _config >> "seekerAccuracy" ),
                getNumber ( _config >> "seekerMaxRange" ),
                getNumber ( _config >> "seekerMinRange" )
            ],
            [ diag_tickTime, [], [], _lastKnownPosState, _navigationParameters, [_initialYaw + (_yawRollPitch select 1), _initialRoll, _initialPitch + (_yawRollPitch select 2)]],
            [
                // target data from missile. Must be filled by seeker for navigation to work
                [0, 0, 0],  // direction to target
                [0, 0, 0],  // direction to attack profile
                0,          // range to target
                [0, 0, 0],  // target velocity
                [0, 0, 0]   // target acceleration
            ],
            [0, _navigationStateData]
        ];

private _onFiredFunc = getText (configFile >> QGVAR(SeekerTypes) >> _seekerType >> "onFired");
TRACE_1("seeker on fired",_onFiredFunc);
if (_onFiredFunc != "") then {
    _args call (missionNamespace getVariable _onFiredFunc);
};

_onFiredFunc = getText (configFile >> QGVAR(AttackProfiles) >> _attackProfile >> "onFired");
TRACE_1("attack on fired",_onFiredFunc);
if (_onFiredFunc != "") then {
    _args call (missionNamespace getVariable _onFiredFunc);
};

if (_states isEqualTo []) then {
    _onFiredFunc = getText (configFile >> QGVAR(NavigationTypes) >> _navigationType >> "onFired");
    TRACE_1("navigation on fired",_onFiredFunc);
    if (_onFiredFunc != "") then {
        private _navState = (_args call (missionNamespace getVariable _onFiredFunc));
        (_args select 4) set [4, _navState];
    };
} else {
    {
        _onFiredFunc = getText (configFile >> QGVAR(NavigationTypes) >> _x >> "onFired");
        TRACE_1("navigation on fired",_onFiredFunc);
        if (_onFiredFunc != "") then {
            private _navState = (_args call (missionNamespace getVariable _onFiredFunc));
            (_navigationStateData select _forEachIndex) set [2, _navState];
        };
    } forEach getArray (_config >> "navigationTypes");
};

// Run the "onFired" function passing the full guidance args array
_onFiredFunc = getText (_config >> "onFired");
TRACE_1("general on fired",_onFiredFunc);
if (_onFiredFunc != "") then {
    _args call (missionNamespace getVariable _onFiredFunc);
};

// Reverse:
//  _args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData", "_navigationStateData"];
//      _firedEH params ["_shooter","","","","_ammo","","_projectile"];
//      _launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
//          _targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
//      _flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
//      _stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_navigationParams", "_guidanceParameters"];
//      _seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
//      _targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

_args
