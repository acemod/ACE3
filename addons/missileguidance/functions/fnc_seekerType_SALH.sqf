//#define DEBUG_MODE_FULL
#include "script_component.hpp"

EXPLODE_7_PVT(((_this select 1) select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
private["_angleFov", "_canSeeTarget", "_foundTargetPos", "_laserResult", "_launchParams", "_seekerParams", "_laserCode", "_laserParams", "_seekerTargetPos", "_sensorPos", "_target"];
_seekerTargetPos = _this select 0;
_launchParams = _this select 1;
_seekerParams = _launchParams select 3;
_angleFov = _seekerParams select 0;

_laserParams = (_launchParams select 1) select 5;
TRACE_2("", _launchParams, _laserParams);
if(!isNil "_target") then {
    // Handle AI or moving vanilla lasers
    _foundTargetPos = getPosASL _target;
} else {
    _laserResult = [(getPosASL _projectile), (velocity _projectile), _angleFov, [(_laserParams select 1),(_laserParams select 2)], (_laserParams select 0)] call EFUNC(laser,seekerFindLaserSpot);
    _foundTargetPos = _laserResult select 0;
    TRACE_1("Search", _laserResult);
};

if(!isNil "_foundTargetPos") then {
    //_canSeeTarget = [_projectile, _foundTargetPos, _angleFov] call FUNC(checkSeekerAngle);

    // If we got here, it was an invalid target, just return a spot 5m in front of the missile
    if(!_canSeeTarget) then { 
        _foundTargetPos = _sensorPos vectorAdd ((velocity _projectile) vectorMultiply 5);
    };

};

_foundTargetPos;