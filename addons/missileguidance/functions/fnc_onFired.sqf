//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Bail if guidance is disabled
// Bail on locality of the projectile, it should be local to us
if(GVAR(enabled) < 1 || {!local _projectile} ) exitWith { false };

if( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith { false };

private["_config", "_configs", "_enabled", "_target", "_seekerType", "_attackProfile"];
private["_args", "_canUseLock", "_guidingUnit", "_launchPos", "_lockMode", "_targetPos", "_vanillaTarget"];

PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

// Bail on not missile
if(! (_ammo isKindOf "MissileBase") ) exitWith { false }; 

//Verify ammo has explicity added guidance config (ignore inheritances)
_configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
if( (count _configs) < 1) exitWith {};

_config = (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON));
_enabled = getNumber ( _config >> "enabled");

// Bail if guidance is not enabled
if(isNil "_enabled" || {_enabled != 1}) exitWith { false };

_target = (vehicle _shooter) getVariable [QGVAR(target), nil];
_targetPos = (vehicle _shooter) getVariable [QGVAR(targetPosition), nil];
_seekerType = (vehicle _shooter) getVariable [QGVAR(seekerType), nil];
_attackProfile = (vehicle _shooter) getVariable [QGVAR(attackProfile), nil];
_lockMode  = (vehicle _shooter) getVariable [QGVAR(lockMode), nil];

// @TODO: make this vehicle shooter, but we need to differentiate where its set in ace_laser
_laserCode = _shooter getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
_laserInfo = [_laserCode, ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH];

_launchPos = getPosASL (vehicle _shooter);

TRACE_3("Begin guidance", _target, _seekerType, _attackProfile);

if ( isNil "_seekerType" || { ! ( _seekerType in (getArray (_config >> "seekerTypes" ) ) ) } ) then { 
    _seekerType = getText (_config >> "defaultSeekerType");
}; 
if ( isNil "_attackProfile" || { ! ( _attackProfile in (getArray (_config >> "attackProfiles" ) ) ) } ) then { 
    _attackProfile = getText (_config >> "defaultAttackProfile"); 
};
if ( isNil "_lockMode" || { ! ( _lockMode in (getArray (_config >> "seekerLockModes" ) ) ) } ) then { 
    _lockMode = getText (_config >> "defaultSeekerLockMode"); 
};

// If we didn't get a target, try to fall back on tab locking
if(isNil "_target") then {
    if(!isPlayer _shooter) then {
        // This was an AI shot, lets still guide it on the AI target
        _target = _shooter getVariable[QGVAR(vanilla_target), nil];
        TRACE_1("Detected AI Shooter!", _target);
    } else {
        _canUseLock = getNumber (_config >> "canVanillaLock");
        // @TODO: Get vanilla target
        if(_canUseLock > 0 || difficulty < 1) then {
            _vanillaTarget = cursorTarget;
            
            TRACE_1("Using Vanilla Locking", _vanillaTarget);
            if(!isNil "_vanillaTarget") then {
                _target = _vanillaTarget;
            };
        };
    };
};

TRACE_4("Beginning ACE guidance system",_target,_ammo,_seekerType,_attackProfile);
_args = [_this, 
            [_shooter, 
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
            [ diag_tickTime, [], [] ]
        ];
  
// Hand off to the guiding unit. We just use local player so local PFH fires for now
// Laser code needs to give us a shooter for LOBL, or the seeker unit needs to be able to shift locality
// Based on its homing laser
// Lasers need to be handled in a special LOAL/LOBL case

//if(isPlayer _shooter) then {
//    _guidingUnit = ACE_player;
//
//    if(local _guidingUnit) then {
//        [FUNC(guidancePFH), 0, _args ] call cba_fnc_addPerFrameHandler;
//    } else {
//        [QGVAR(handoff), [_guidingUnit, _args] ] call FUNC(doHandoff);
//    };
//} else {
    [FUNC(guidancePFH), 0, _args ] call cba_fnc_addPerFrameHandler;
//};


/* Clears locking settings
(vehicle _shooter) setVariable [QGVAR(target), nil];
(vehicle _shooter) setVariable [QGVAR(seekerType), nil];
(vehicle _shooter) setVariable [QGVAR(attackProfile), nil];
(vehicle _shooter) setVariable [QGVAR(lockMode), nil];
*/