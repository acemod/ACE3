#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_targetPos", "_projectilePos", "_target", "_seekerTargetPos", "_launchParams", "_targetLaunchParams"];
private["_distanceToTarget", "_distanceToShooter", "_addHeight", "_returnTargetPos"];
_seekerTargetPos = _this select 0;
_launchParams = _this select 1;

_target = _launchParams select 0;
_targetLaunchParams = _launchParams select 1;

_shooterPos = getPosASL _shooter;
_projectilePos = getPosASL _projectile;

_distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;    
_distanceToShooter = _projectilePos vectorDistance _shooterPos;

TRACE_2("", _distanceToTarget, _distanceToShooter);

_addHeight = [0,0,0];
if(_distanceToShooter < 100) then {
    _addHeight = [0,0,_distanceToTarget];
} else {
    _addHeight = [0,0, _distanceToTarget*0.02];
};

TRACE_3("", _distanceToTarget,_distanceToShooter,_addHeight);

_returnTargetPos = _seekerTargetPos vectorAdd _addHeight;

#ifdef DEBUG_MODE_FULL
drawLine3D [(ASLtoATL _returnTargetPos) vectorAdd _addHeight, ASLtoATL _returnTargetPos, [0,1,0,1]];
#endif

TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;