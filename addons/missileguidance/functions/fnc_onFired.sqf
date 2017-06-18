/*
 * Author: jaynus / nou
 * Fired event handler, starts guidance if enabled for ammo
 *
 * Arguments:
 * 0: Shooter (Man/Vehicle) <OBJECT>
 * 4: Ammo <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "", "", "ACE_Javelin_FGM148", "", theMissile] call ace_missileguidance_fnc_onFired;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_shooter","","","","_ammo","","_projectile"];

// Bail on not missile
if (!(_ammo isKindOf "MissileBase")) exitWith {};

// Bail if guidance is disabled for this ammo
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};

// Bail on locality of the projectile, it should be local to us
if (GVAR(enabled) < 1 || {!local _projectile} ) exitWith {};

// Bail if shooter isn't player AND system not enabled for AI:
if ( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith {};

// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
if ((count _configs) < 1) exitWith {};

// MissileGuidance is enabled for this shot
TRACE_4("enabled",_shooter,_ammo,_projectile,typeOf _shooter);

private _config = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);

private _target = _shooter getVariable [QGVAR(target), nil];
private _targetPos = _shooter getVariable [QGVAR(targetPosition), nil];
private _seekerType = _shooter getVariable [QGVAR(seekerType), nil];
private _attackProfile = _shooter getVariable [QGVAR(attackProfile), nil];
private _lockMode = _shooter getVariable [QGVAR(lockMode), nil];

private _laserCode = _shooter getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _laserInfo = [_laserCode, ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH];

TRACE_6("getVars",_target,_targetPos,_seekerType,_attackProfile,_lockMode,_laserCode);

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

// If we didn't get a target, try to fall back on tab locking
if (isNil "_target") then {
    if (!isPlayer _shooter) then {
        // This was an AI shot, lets still guide it on the AI target
        _target = _shooter getVariable [QGVAR(vanilla_target), nil];
        TRACE_1("Detected AI Shooter!", _target);
    } else {
        private _canUseLock = getNumber (_config >> "canVanillaLock");
        // @TODO: Get vanilla target
        if (_canUseLock > 0 || difficulty < 1) then {
            private _vanillaTarget = cursorTarget;

            TRACE_1("Using Vanilla Locking", _vanillaTarget);
            if (!isNil "_vanillaTarget") then {
                _target = _vanillaTarget;
            };
        };
    };
};

// Array for seek last target position
private _seekLastTargetPos = (getNumber ( _config >> "seekLastTargetPos")) == 1;
private _lastKnownPosState = [_seekLastTargetPos];
if (_seekLastTargetPos && {!isNil "_target"}) then {
    _lastKnownPosState set [1, (getPosASL _target)];
} else {
    _lastKnownPosState set [1, [0,0,0]];
};

TRACE_4("Beginning ACE guidance system",_target,_ammo,_seekerType,_attackProfile);
private _args = [_this,
            [   _shooter,
                [_target, _targetPos, _launchPos],
                _seekerType,
                _attackProfile,
                _lockMode,
                _laserInfo
            ],
            [
                getNumber ( _config >> "minDeflection" ),
                getNumber ( _config >> "maxDeflection" ),
                getNumber ( _config >> "incDeflection" )
            ],
            [
                getNumber ( _config >> "seekerAngle" ),
                getNumber ( _config >> "seekerAccuracy" ),
                getNumber ( _config >> "seekerMaxRange" )
            ],
            [ diag_tickTime, [], [], _lastKnownPosState]
        ];


// Run the "onFired" function passing the full guidance args array
private _onFiredFunc = getText (_config >> "onFired");
TRACE_1("",_onFiredFunc);
if (_onFiredFunc != "") then {
    _args call (missionNamespace getVariable _onFiredFunc);
};
        
        
// Reverse:
//  _args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
//      _firedEH params ["_shooter","","","","_ammo","","_projectile"];
//      _launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo"];
//          _targetLaunchParams params ["_target", "_targetPos", "_launchPos"];
//      _stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState"];
//      _seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange"];


// Hand off to the guiding unit. We just use local player so local PFH fires for now
// Laser code needs to give us a shooter for LOBL, or the seeker unit needs to be able to shift locality
// Based on its homing laser
// Lasers need to be handled in a special LOAL/LOBL case

//if (isPlayer _shooter) then {
//    private _guidingUnit = ACE_player;
//
//    if (local _guidingUnit) then {
//        [FUNC(guidancePFH), 0, _args ] call CBA_fnc_addPerFrameHandler;
//    } else {
//        [QGVAR(handoff), [_guidingUnit, _args] ] call FUNC(doHandoff);
//    };
//} else {
    // [FUNC(guidancePFH), 0, _args ] call CBA_fnc_addPerFrameHandler;
//};

[FUNC(guidancePFH), 0, _args ] call CBA_fnc_addPerFrameHandler;


/* Clears locking settings
(vehicle _shooter) setVariable [QGVAR(target), nil];
(vehicle _shooter) setVariable [QGVAR(seekerType), nil];
(vehicle _shooter) setVariable [QGVAR(attackProfile), nil];
(vehicle _shooter) setVariable [QGVAR(lockMode), nil];
 */
