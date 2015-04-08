#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Bail if guidance is disabled
if(!GVAR(enabled)) exitWith { false };

// Bail on locality of the projectile, it should be local to us
if(!local _projectile) exitWith { false };

private["_config", "_enabled", "_target", "_seekerType", "_attackProfile"];
PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

_config = configFile >> "CfgAmmo" >> _ammo >> "ACE_MissileGuidance";
_enabled = getNumber ( _config >> "enabled");

// Bail if guidance is not enabled
if(isNil "_enabled" || {_enabled != 1}) exitWith { false };


_target = _shooter getVariable[QGVAR(target), nil];
_seekerType = _shooter getVariable [QGVAR(seekerType), nil];
_attackProfile = _shooter getVariable [QGVAR(attackProfile), nil];
TRACE_3("Begin guidance", _target, _seekerType, _attackProfile);

if ( isNil "_seekerType" || { ! ( _seekerType in (getArray (_config >> "seekerTypes" ) ) ) } ) then { 
    _seekerType = getText (_config >> "defaultSeekerType");
}; 
if ( isNil "_attackProfile" || { ! ( _attackProfile in (getArray (_config >> "attackProfiles" ) ) ) } ) then { 
    _attackProfile = getText (_config >> "defaultAttackProfile"); 
}; 

TRACE_4("Beginning ACE guidance system",_target,_ammo,_seekerType,_attackProfile);
[FUNC(guidancePFH), 0.1, [_this, 
                            [ACE_player, 
                                [_target, _targetPos, _launchPos], 
                                _seekerType, 
                                _attackProfile
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
                            [ diag_tickTime ]
                        ]
] call cba_fnc_addPerFrameHandler;
