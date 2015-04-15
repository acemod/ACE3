//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Bail if guidance is disabled
// Bail on locality of the projectile, it should be local to us
if(GVAR(enabled) < 1 || {!local _projectile} ) exitWith { false };

if( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith { false };

private["_config", "_enabled", "_target", "_seekerType", "_attackProfile"];
PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

// Bail on not missile
if(! (_ammo isKindOf "MissileBase") ) exitWith { false }; 

_config = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);
_enabled = getNumber ( _config >> "enabled");

// Bail if guidance is not enabled
if(isNil "_enabled" || {_enabled != 1}) exitWith { false };

_target = (vehicle _shooter) getVariable [QGVAR(target), nil];
_targetPos = (vehicle _shooter) getVariable [QGVAR(targetPosition), nil];
_seekerType = (vehicle _shooter) getVariable [QGVAR(seekerType), nil];
_attackProfile = (vehicle _shooter) getVariable [QGVAR(attackProfile), nil];
_lockMode  = (vehicle _shooter) getVariable [QGVAR(lockMode), nil];

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
        if(_canUseLock > 0) then {
            // @TODO: Get vanilla target
            _vanillaTarget = cursorTarget;
            
            TRACE_1("Using Vanilla Locking", _vanillaTarget);
            if(!isNil "_vanillaTarget") then {
                _target = _vanillaTarget;
            };
        };
    };
};

TRACE_4("Beginning ACE guidance system",_target,_ammo,_seekerType,_attackProfile);
[FUNC(guidancePFH), 0, [_this, 
                            [_shooter, 
                                [_target, _targetPos, _launchPos], 
                                _seekerType, 
                                _attackProfile,
                                _lockMode
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
                        ]
] call cba_fnc_addPerFrameHandler;

/* Clears locking settings
(vehicle _shooter) setVariable [QGVAR(target), nil];
(vehicle _shooter) setVariable [QGVAR(seekerType), nil];
(vehicle _shooter) setVariable [QGVAR(attackProfile), nil];
(vehicle _shooter) setVariable [QGVAR(lockMode), nil];
*/