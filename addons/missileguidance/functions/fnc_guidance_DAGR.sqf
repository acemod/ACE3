//#define DEBUG_MODE_FULL
#include "script_component.hpp"

FUNC(guidance_DIRECT_LOAL_PFH) = {
    //TRACE_1("enter", _this);
    private["_args", "_shooter", "_dagr", "_curVelocity", "_targets", "_target", "_yVec", "_xVec", "_zVec", "_dagrPos", "_shooterPos", "_distanceToTarget", "_distanceToShooter", "_def"];
    _args = _this select 0;
    //PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
    _shooter = _args select 0;
    _dagr = _args select 6;
    _curVelocity = velocity _dagr;
    
    if(!alive _dagr || isNull _dagr || isNull _shooter) exitWith {
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
    
    _targets = [_dagr, ACE_DEFAULT_LASER_CODE, 70, _curVelocity] call ace_laser_fnc_findLaserDesignator;
    TRACE_2("Targets", _target, _targets);
    
    if((_targets select 0)) then {
        _target = _targets select 1;
        
        // player sideChat "FUCK!";
        // drop ["\a3\data_f\Cl_basic","","Billboard",1,20,(getPos _dagr),[0,0,0],1,1.275,1.0,0.0,[5],[[1,0,0,1]],[0],0.0,2.0,"","",""];
        
        
        _yVec = vectorDir _dagr;
        _zVec = vectorUp _dagr;
        _xVec = vectorNormalized (_yVec vectorCrossProduct _zVec);
        
        _dagrPos = getPosASL _dagr;
        // player sideChat "G!";
        _targetPos = getPosASL _target;
        _shooterPos = getPosASL _shooter;
        
        if((count _targetPos) > 0) then {
            _distanceToTarget = _dagrPos vectorDistance _targetPos;    
            _distanceToShooter = _dagrPos vectorDistance _shooterPos;
            
            _addHeight = [0,0,(_dagrPos distance _targetPos)*0.02];
            #ifdef DEBUG_MODE_FULL
            drawLine3D [(ASLtoATL _targetPos) vectorAdd _addHeight, ASLtoATL _targetPos, [0,1,0,1]];
            #endif
            
            _targetPos = _targetPos vectorAdd _addHeight;

            _def = 0.0030;
            if(_distanceToShooter > 100) then {
                _def = 0.0020;
            };
            
            _targetVectorSeeker = [_dagr, [_xVec, _yVec, _zVec], _targetPos] call FUNC(translateToWeaponSpace);
            // _targetVectorSeeker = _dagr worldToModel (ASLtoATL _targetPos);
            // _targetVectorSeeker = [0,0,0] vectorFromTo _targetVectorSeeker;
            _yaw = 0.0;
            if((_targetVectorSeeker select 0) < 0) then {
                _yaw = -_def;
            } else {
                if((_targetVectorSeeker select 0) > 0) then {
                    _yaw = _def;
                };
            };
            
            _pitch = 0.0;
            if((_targetVectorSeeker select 2) < 0) then {
                _pitch = -_def;
            } else {
                if((_targetVectorSeeker select 2) > 0) then {
                    _pitch = _def;
                };
            };
    #ifdef DEBUG_MODE_FULL
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _dagrPos, 0.75, 0.75, 0, str _vectorTo, 1, 0.025, "TahomaB"];
            drawLine3D [ASLtoATL _dagrPos, ASLtoATL _targetPos, [1,0,0,1]];
            
            _distance = ([getPos startPos, _dagrPos] call BIS_fnc_distance2D);
            _marker = createMarkerLocal [format["m%1", MARKERCOUNT], [_distance, _dagrPos select 2]];
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerColorLocal "ColorRed";

            MARKERCOUNT = MARKERCOUNT + 1;
    #endif        
    
            if(accTime > 0) then {
                _outVector = [_dagr, [_xVec, _yVec, _zVec], [_yaw, 1/accTime, _pitch]] call FUNC(translateToModelSpace);
                // _outVector = _dagr modelToWorld [_yaw, 1, _pitch];
                // _outVector = ATLtoASL _outVector;
                _vectorTo = _dagrPos vectorFromTo _outVector;
                
                // hintSilent format["v: %1", _vectorTo];
            
                // _dagr setVectorDir _vectorTo;
                _dagr setVectorDirAndUp [_vectorTo, vectorUp _dagr];
            };
            
    #ifdef DEBUG_MODE_FULL
            hintSilent format["d: %1", _distanceToTarget];
    #endif
        };
    };
};

FUNC(guidance_DAGR_DIRECT_LOAL) = {
    PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
    
    GVAR(lastTime) = time;
    [FUNC(guidance_DIRECT_LOAL_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
_fireMode = _shooter getVariable ["ACE_FIRE_SELECTION", ACE_DEFAULT_FIRE_SELECTION];

switch (_fireMode select 0) do {
    // Default to FIREMODE_DIRECT_LOAL
    // FIREMODE_DIRECT_LOAL
    default {
        LOG("Initiating DAGR FIREMODE_DIRECT_LOAL");
        _this call FUNC(guidance_DAGR_DIRECT_LOAL);
    };
};