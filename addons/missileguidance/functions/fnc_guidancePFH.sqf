#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_args", "_launchParams", "_targetLaunchParams", "_config", "_flightParams", "_seekerParams"];
_args = _this select 0;
EXPLODE_7_PVT((_args select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

_launchParams = _args select 1;
_targetLaunchParams = _launchParams select 1;
_flightParams = _args select 2;
_seekerParams = _args select 3;

_config = configFile >> "CfgAmmo" >> _ammo >> "ACE_MissileGuidance";

if(!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};

_seekerTargetPos = _args call FUNC(doSeekerSearch);
if(!isNil "_seekerTargetPos") then {

    _profileAdjustedTargetPos = [_seekerTargetPos,_args] call FUNC(doAttackProfile);
   
    _minDeflection = _flightParams select 0;
    _maxDeflection = _flightParams select 1;
    _incDeflection = _flightParams select 2;
    
    _yVec = vectorDir _projectile;
    _zVec = vectorUp _projectile;
    _xVec = vectorNormalized (_yVec vectorCrossProduct _zVec);

    _projectilePos = getPosASL _projectile;
        
    _targetVectorSeeker = [_projectile, [_xVec, _yVec, _zVec], _profileAdjustedTargetPos] call FUNC(translateToWeaponSpace);
    _targetVector = [0,0,0] vectorFromTo _targetVectorSeeker;
    TRACE_1("", _targetVectorSeeker, _targetVector);
    
    _yaw = 0;
    _pitch = 0;
               
    if((_targetVectorSeeker select 0) < 0) then {
        _yaw = - ( (_minDeflection max (abs(_targetVector select 0) min _maxDeflection) ) );
    } else {
        if((_targetVectorSeeker select 0) > 0) then {
            _yaw = ( (_minDeflection max ((_targetVector select 0) min _maxDeflection) ) );
        };
    };
    if((_targetVectorSeeker select 2) < 0) then {
        _pitch = - ( (_minDeflection max (abs(_targetVector select 2) min _maxDeflection) ) );
    } else {
        if((_targetVectorSeeker select 2) > 0) then {
            _pitch = ( (_minDeflection max ((_targetVector select 2) min _maxDeflection) ) );
        };
    };
   
#ifdef DEBUG_MODE_FULL
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _projectilePos, 0.75, 0.75, 0, str _vectorTo, 1, 0.025, "TahomaB"];
    drawLine3D [ASLtoATL _projectilePos, ASLtoATL _profileAdjustedTargetPos, [1,0,0,1]];
#endif        

    if(accTime > 0) then {
        _outVector = [_projectile, [_xVec, _yVec, _zVec], [_yaw, 1/accTime, _pitch]] call FUNC(translateToModelSpace);
        _vectorTo = _projectilePos vectorFromTo _outVector;
        
        _projectile setVectorDirAndUp [_vectorTo, vectorUp _projectile];
    };
    
#ifdef DEBUG_MODE_FULL
    hintSilent format["d: %1", _distanceToTarget];
#endif
};
