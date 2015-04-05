//#define DEBUG_MODE_FULL
#include "script_component.hpp"
//_this=[TEST_AI_HELICOPTER,"missiles_DAGR","missiles_DAGR","Far_AI","M_PG_AT","24Rnd_PG_missiles",163988: rocket_01_fly_f.p3d]
TRACE_1("Launch", _this);
PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

FUNC(guidance_Javelin_LOBL_DIR_PFH) = {
    
};

FUNC(guidance_Javelin_LOBL_TOP_PFH) = {
	TRACE_1("enter", _this);
	private["_pitch", "_yaw", "_wentTerminal", "_target", "_targetPos", "_curVelocity", "_missile", 
            "_launchPos", "_targetStartPos", "_defPitch", "_defYaw"];
	_args = _this select 0;
	//PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	_shooter = _args select 0;
	_missile = _args select 6;
	
	if((count _args) > 7) then {
		_saveArgs = _args select 7;
		_target = _saveArgs select 0;
		_targetStartPos = _saveArgs select 1;
        _launchPos = _saveArgs select 2;
        _wentTerminal = _saveArgs select 3;
	} else {
        _wentTerminal = false;
        _launchPos = getPosASL _shooter;
        _target = ACE_player getVariable[QGVAR(currentTarget), objNull];
        _targetStartPos = ACE_player getVariable[QGVAR(currentTargetPos), [0,0,0]];
	};
	
    if(!alive _missile || isNull _missile || isNull _target) exitWith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};
    
    _targetPos = getPosASL _target;
	_curVelocity = velocity _missile;
	
    TRACE_4("", _target, _targetPos, _launchPos, _targetStartPos);

	_addHeight = [0,0,0];
	if(!isNil "_target") then {
		
		_yVec = vectorDir _missile;
		_zVec = vectorUp _missile;
		_xVec = vectorNormalized (_yVec vectorCrossProduct _zVec);
		
		_missilePos = getPosASL _missile;
		// player sideChat "G!";

		TRACE_4("Phase Check", _launchPos, _missilePos, _targetPos, (_missilePos distance _targetPos));
		if((count _targetPos) > 0) then {
			_distanceToTarget = [(_missilePos select 0), (_missilePos select 1), (_targetPos select 2)]  vectorDistance _targetPos;	

			if( (_missilePos select 2) < (_targetPos select 2) + 200 && !_wentTerminal) then {
				_addHeight = [0,0, ( (_distanceToTarget * 2) + 400)];
				
                _defPitch = 0.25;
                _defYaw = 0.035;
                
                TRACE_1("Climb phase", _addHeight);
			} else {
				_wentTerminal = true;
				_this set[2, _wentTerminal];
				
                _defPitch = 0.25;
                _defYaw = 0.25;
                
                TRACE_1("TERMINAL", "");
			};
			_targetPos = _targetPos vectorAdd _addHeight;

			_targetVectorSeeker = [_missile, [_xVec, _yVec, _zVec], _targetPos] call FUNC(translateToWeaponSpace);
			TRACE_5("", _missile, _xVec, _yVec, _zVec, _targetPos);
            
            _yaw = 0.0;
            _pitch = 0.0;

            // Stop jinking on terminal final decent
            if((_missilePos distance _targetPos) < 50) then {
                _defPitch = 0.0015;
                _defYaw = 0.0015;
            };
               
            if((_targetVectorSeeker select 0) < 0) then {
                _yaw = -_defYaw;
            } else {
                if((_targetVectorSeeker select 0) > 0) then {
                    _yaw = _defYaw;
                };
            };

            if((_targetVectorSeeker select 2) < 0) then {
                _pitch = -_defPitch;
            } else {
                if((_targetVectorSeeker select 2) > 0) then {
                    _pitch = _defPitch;
                };
            };
			
			TRACE_3("", _targetVectorSeeker, _pitch, _yaw);
			
	#ifdef DEBUG_MODE_FULL
			drawLine3D [(ASLtoATL _targetPos) vectorAdd _addHeight, ASLtoATL _targetPos, [0,1,0,1]];
			
			_light = "#lightpoint" createVehicleLocal (getPos _missile);
			_light setLightBrightness 1.0;
			_light setLightAmbient [1.0, 0.0, 0.0];
			_light setLightColor [1.0, 0.0, 0.0];
			
			drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _missilePos, 0.75, 0.75, 0, str _vectorTo, 1, 0.025, "TahomaB"];
			drawLine3D [ASLtoATL _missilePos, ASLtoATL _targetPos, [1,0,0,1]];

			MARKERCOUNT = MARKERCOUNT + 1;
	#endif		
	
			if(accTime > 0) then {
				TRACE_5("", _xVec, _yVec, _zVec, _yaw, _pitch);
				_outVector = [_missile, [_xVec, _yVec, _zVec], [_yaw, 1/accTime, _pitch]] call FUNC(translateToModelSpace);
				
				_vectorTo = _missilePos vectorFromTo _outVector;
				TRACE_3("", _missile, _outVector, _vectorTo);
				_missile setVectorDirAndUp [_vectorTo, vectorUp _missile];
			};
			
	#ifdef DEBUG_MODE_FULL
			hintSilent format["d: %1", _distanceToTarget];
	#endif
		};
	};
    
     _saveArgs = [_target,_targetStartPos, _launchPos, _wentTerminal];
    _args set[7, _saveArgs ];
    _this set[0, _args];
};

FUNC(guidance_Javelin_LOBL_TOP) = {
	PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	
	GVAR(lastTime) = time;
	[FUNC(guidance_Javelin_LOBL_TOP_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

FUNC(guidance_Javelin_LOBL_DIR) = {
	PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	
	GVAR(lastTime) = time;
	[FUNC(guidance_Javelin_LOBL_DIR_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

if(!local _shooter) exitWith { false };
if(_ammo == "M_Titan_AT") then {
	_fireMode = _shooter getVariable ["ACE_FIRE_SELECTION", ACE_JAV_FIREMODE_TOP];
	
	switch (_fireMode) do {
        // Default to FIREMODE_DIRECT_LOAL
        // FIREMODE_DIRECT_LOAL
        case ACE_JAV_FIREMODE_DIR: {
            LOG("Initiating Javelin FIREMODE_LOBL_DIR");
            _this call FUNC(guidance_Javelin_LOBL_DIR);
        };
        default {
            LOG("Initiating Javelin FIREMODE_LOBL_TOP");
            _this call FUNC(guidance_Javelin_LOBL_TOP);
        };
    };
};