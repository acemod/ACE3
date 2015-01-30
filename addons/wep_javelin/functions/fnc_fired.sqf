//#define DEBUG_MODE_FULL
#include "script_component.hpp"
//_this=[TEST_AI_HELICOPTER,"missiles_DAGR","missiles_DAGR","Far_AI","M_PG_AT","24Rnd_PG_missiles",163988: rocket_01_fly_f.p3d]
TRACE_1("enter", _this);
PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

FUNC(guidance_Javelin_LOBL_HI_PFH) = {
	TRACE_1("enter", _this);
	private["_pitch", "_yaw", "_wentTerminal", "_target", "_targetPos", "_curVelocity", "_missile" ];
	_args = _this select 0;
	//PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	_shooter = _args select 0;
	_missile = _args select 6;
	
	if((count _this) > 2) then {
		_wentTerminal = _this select 2;
	} else {
		_this set[2, false];
		_wentTerminal = false;
	};
	
	if((count _this) > 3) then {
		_targets = _this select 3;
		_target = _targets select 0;
		_targetPos = _targets select 1;
	} else {
		_this set[3, [GVAR(currentTarget),GVAR(currentTargetPos)] ];
		_target = GVAR(currentTarget);
		_targetPos = GVAR(currentTargetPos);
	};
	
	_curVelocity = velocity _missile;
	
	if(!alive _missile || isNull _missile) exitWith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};
	
	
	_launchPos = _shooter getVariable [QGVAR(launchPos), nil];
	if(isNil "_launchPos") then {
		TRACE_1("Setting launch parameters", "");
		_launchPos = getPosASL _shooter;
		_shooter setVariable [QGVAR(launchPos), _launchPos, false];
		_shooter setVariable [QGVAR(launchTime), diag_tickTime, false];
	};
		
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
			
			_defPitch = 0.25;
			
			if( (_missilePos select 2) < (_targetPos select 2) + 160 && !_wentTerminal) then {
				_addHeight = [0,0,(_targetPos select 2) + ( (_distanceToTarget * 2) + 160)];
				TRACE_1("Climb phase", _addHeight);
			} else {
				_wentTerminal = true;
				_this set[2, _wentTerminal];
				TRACE_1("TERMINAL", "");
			};
			_targetPos = _targetPos vectorAdd _addHeight;
			
			_defYaw = 0.0035;
			
			_targetVectorSeeker = [_missile, [_xVec, _yVec, _zVec], _targetPos] call FUNC(translateToWeaponSpace);
			_yaw = 0.0;
			TRACE_5("", _missile, _xVec, _yVec, _zVec, _targetPos);
			if((_targetVectorSeeker select 0) < 0) then {
				_yaw = -_defYaw;
			} else {
				if((_targetVectorSeeker select 0) > 0) then {
					_yaw = _defYaw;
				};
			};
			
			_pitch = 0.0;
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
			
			_distance = ([getPos startPos, _missilePos] call BIS_fnc_distance2D);
			_marker = createMarkerLocal [format["m%1", MARKERCOUNT], [_distance, _missilePos select 2]];
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerColorLocal "ColorRed";

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
};

FUNC(guidance_Javelin_LOBL_HI) = {
	PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	
	GVAR(lastTime) = time;
	[FUNC(guidance_Javelin_LOBL_HI_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

if(!local _shooter) exitWith { false };
if(_ammo == "M_Titan_AT") then {
	_fireMode = _shooter getVariable ["ACE_FIRE_SELECTION", ACE_DEFAULT_FIRE_SELECTION];
	
	switch (_fireMode select 0) do {
	// Default to FIREMODE_DIRECT_LOAL
	// FIREMODE_DIRECT_LOAL
	default {
		LOG("Initiating Javelin FIREMODE_LOBL_HI");
		_this call FUNC(guidance_Javelin_LOBL_HI);
	};
};
};