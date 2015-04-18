//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_targets", "_foundTargetPos", "_launchParams", "_seekerParams", "_targetLaunchParams"];
private["_angleFov", "_angleOkay", "_losOkay", "_seekerTargetPos", "_sensorPos", "_target"];

_seekerTargetPos = _this select 0;

_launchParams = _this select 1;
_target = (((_launchParams select 1) select 1) select 0);
_seekerParams = _launchParams select 3;

TRACE_1("", _this);
TRACE_1("", _launchParams);

// TODO:: Make sure the missile maintains LOS
_foundTargetPos = [0,0,0];
if(!isNil "_target") then {
    _foundTargetPos = getPosASL _target;
    //_foundTargetPos = (_target modelToWorldVisual (getCenterOfMass _target));
};

// @TODO: This is seeker LOS and angle checks for LOAL only; LOBL does not need visual
_angleFov = _seekerParams select 0;
_angleOkay = [_projectile, _foundTargetPos, _angleFov] call FUNC(checkSeekerAngle);

_losOkay = false;
if(_angleOkay) then {
    _losOkay = [_projectile, _target] call FUNC(checkSeekerLos);
};
TRACE_2("", _angleOkay, _losOkay);

// If we got here, it was an invalid target, just return a spot 5m in front of the missile
if(!_angleOkay || !_losOkay) then { 
    _foundTargetPos = _sensorPos vectorAdd ((velocity _projectile) vectorMultiply 5);
} else {
    TRACE_2("", _target, _foundTargetPos);
    private["_projectileSpeed", "_distanceToTarget", "_eta", "_adjustVelocity"];
    // @TODO: Configurable lead for seekers
    _projectileSpeed = (vectorMagnitude velocity _projectile);
    _distanceToTarget = (getPosASL _projectile) vectorDistance _foundTargetPos; 

    _eta = _distanceToTarget / _projectileSpeed;

    _adjustVelocity = (velocity _target) vectorMultiply _eta;
    _foundTargetPos = _foundTargetPos vectorAdd _adjustVelocity;
};


_foundTargetPos;