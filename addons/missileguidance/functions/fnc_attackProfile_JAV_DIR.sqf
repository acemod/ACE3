//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define STAGE_LAUNCH 1
#define STAGE_CLIMB 2
#define STAGE_COAST 3
#define STAGE_TERMINAL 4

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_targetPos", "_projectilePos", "_target", "_seekerTargetPos", "_launchParams", "_targetLaunchParams"];
private["_distanceToTarget", "_distanceToShooter", "_addHeight", "_returnTargetPos", "_state"];
private["_cruisAlt", "_distanceShooterToTarget", "_shooterPos"];
_seekerTargetPos = _this select 0;
_launchParams = _this select 1;

_target = _launchParams select 0;
_targetLaunchParams = _launchParams select 1;

_state = _this select 2;
if( (count _state) < 1) then {
    _state set[0, STAGE_LAUNCH];
};

_shooterPos = getPosASL _shooter;
_projectilePos = getPosASL _projectile;

_distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;    
_distanceToShooter = _projectilePos vectorDistance _shooterPos;
_distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

TRACE_2("", _distanceToTarget, _distanceToShooter);

// Add height depending on distance for compensate
_returnTargetPos = _seekerTargetPos;

switch( (_state select 0) ) do {
    case STAGE_LAUNCH: {
        TRACE_1("STAGE_LAUNCH","");
        if(_distanceToShooter < 10) then { 
            _returnTargetPos = _seekerTargetPos vectorAdd [0,0,_distanceToTarget*2];
        } else {
            _state set[0, STAGE_CLIMB];
        };
    };
    case STAGE_CLIMB: {
        TRACE_1("STAGE_CLIMB","");
        _cruisAlt = 60 * (_distanceShooterToTarget/2000);

        if( ((ASLToATL _projectilePos) select 2) - ((ASLToATL _seekerTargetPos) select 2) >= _cruisAlt) then {
            _state set[0, STAGE_TERMINAL];
        } else {
             _returnTargetPos = _seekerTargetPos vectorAdd [0,0,_distanceToTarget*1.5];
        };
    };
    case STAGE_TERMINAL: {
        TRACE_1("STAGE_TERMINAL","");
        _returnTargetPos = _seekerTargetPos;
    };
};

#ifdef DEBUG_MODE_FULL
drawLine3D [(ASLtoATL _returnTargetPos), (ASLtoATL _seekerTargetPos), [0,1,0,1]];
#endif

TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;