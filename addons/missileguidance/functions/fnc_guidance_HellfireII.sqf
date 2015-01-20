//#define DEBUG_MODE_FULL
#include "script_component.hpp"

FUNC(guidance_Hellfire_LOAL_HI_PFH) = {
	//TRACE_1("enter", _this);
	_args = _this select 0;
	//PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	_shooter = _args select 0;
	_missile = _args select 6;
	_curVelocity = velocity _missile;
	
	if(!alive _missile || isNull _missile || isNull _shooter) exitWith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};
	
	_launchPos = _shooter getVariable [QGVAR(launchPos), nil];
	if(isNil "_launchPos") then {
		TRACE_1("Setting launch parameters", "");
		_launchPos = getPosASL _shooter;
		_shooter setVariable [QGVAR(launchPos), _launchPos, false];
		_shooter setVariable [QGVAR(launchTime), diag_tickTime, false];
	};
	
	_targets = [_missile, ACE_DEFAULT_LASER_CODE, 70, _curVelocity] call ace__laser_fnc_findLaserDesignator;
	_addHeight = [0,0,0];
	if((_targets select 0)) then {
		_target = _targets select 1;
		TRACE_2("Targets", _target, _targets);
		
		_yVec = vectorDir _missile;
		_zVec = vectorUp _missile;
		_xVec = vectorNormalized (_yVec vectorCrossProduct _zVec);
		
		_missilePos = getPosASL _missile;
		// player sideChat "G!";
		_targetPos = getPosASL _target;
		TRACE_4("Phase Check", _launchPos, _missilePos, _targetPos, (_missilePos distance _targetPos));
		if((count _targetPos) > 0) then {
			_distanceToTarget = _missilePos vectorDistance _targetPos;	
			
			_defPitch = 0.05;
			
			if((_launchPos distance _missilePos) < 400 && (_targetPos distance _missilePos) > 400) then {
				_addHeight = [0,0,(_targetPos select 2) + ((_launchPos distance _targetPos)*2)];
				TRACE_1("Climb phase", _addHeight);
				//_defPitch = 0.1;
			} else {
				// Covered half the distance, go terminal
				if((_missilePos distance _targetPos) < (_launchPos distance _targetPos) / 2) then {
					TRACE_1("TERMINAL", "");
				} else {
					if((_missilePos select 2) > (_targetPos select 2)) then {
						_heightDiff = (_missilePos select 2) - (_targetPos select 2);
						TRACE_1("Coasting", _heightDiff);
						_addHeight = [0,0, _heightDiff];
					};
				};
			};
			_targetPos = _targetPos vectorAdd _addHeight;
			
			_defYaw = 0.0035;
			
			
			_targetVectorSeeker = [_missile, [_xVec, _yVec, _zVec], _targetPos] call FUNC(translateToWeaponSpace);
			_yaw = 0.0;
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
				_outVector = [_missile, [_xVec, _yVec, _zVec], [_yaw, 1/accTime, _pitch]] call FUNC(translateToModelSpace);
				
				_vectorTo = _missilePos vectorFromTo _outVector;
				_missile setVectorDirAndUp [_vectorTo, vectorUp _missile];
			};
			
	#ifdef DEBUG_MODE_FULL
			hintSilent format["d: %1", _distanceToTarget];
	#endif
		};
	};
};

FUNC(guidance_Hellfire_LOAL_DIR_PFH) = {
	//TRACE_1("enter", _this);
	_args = _this select 0;
	//PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	_shooter = _args select 0;
	_missile = _args select 6;
	_curVelocity = velocity _missile;
	
	if(!alive _missile || isNull _missile || isNull _shooter) exitWith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};
	
	_launchPos = _shooter getVariable [QGVAR(launchPos), nil];
	if(isNil "_launchPos") then {
		TRACE_1("Setting launch parameters", "");
		_launchPos = getPosASL _shooter;
		_shooter setVariable [QGVAR(launchPos), _launchPos, false];
		_shooter setVariable [QGVAR(launchTime), diag_tickTime, false];
	};
	
	_targets = [_missile, ACE_DEFAULT_LASER_CODE, 70, _curVelocity] call ace__laser_fnc_findLaserDesignator;
	_addHeight = [0,0,0];
	if((_targets select 0)) then {
		_target = _targets select 1;
		TRACE_2("Targets", _target, _targets);
		
		_yVec = vectorDir _missile;
		_zVec = vectorUp _missile;
		_xVec = vectorNormalized (_yVec vectorCrossProduct _zVec);
		
		_missilePos = getPosASL _missile;
		// player sideChat "G!";
		_targetPos = getPosASL _target;
		TRACE_4("Phase Check", _launchPos, _missilePos, _targetPos, (_missilePos distance _targetPos));
		if((count _targetPos) > 0) then {
			_distanceToTarget = _missilePos vectorDistance _targetPos;	
			
			if((_launchPos distance _missilePos) < 400 && (_targetPos distance _missilePos) > 400) then {
				_addHeight = [0,0,(_targetPos select 2) + (_missilePos distance _targetPos)*0.5];
				TRACE_1("Climb phase", _addHeight);
			} else {
				// Covered half the distance, go terminal
				if((_missilePos distance _targetPos) < (_launchPos distance _targetPos) / 2) then {
					TRACE_1("TERMINAL", "");
				} else {
					if((_missilePos select 2) > (_targetPos select 2)) then {
						_heightDiff = (_missilePos select 2) - (_targetPos select 2);
						TRACE_1("Coasting", _heightDiff);
						_addHeight = [0,0, _heightDiff];
					};
				};
			};
			_targetPos = _targetPos vectorAdd _addHeight;
			
			_defYaw = 0.0035;
			_defPitch = 0.0075;
			
			_targetVectorSeeker = [_missile, [_xVec, _yVec, _zVec], _targetPos] call FUNC(translateToWeaponSpace);
			_yaw = 0.0;
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
				_outVector = [_missile, [_xVec, _yVec, _zVec], [_yaw, 1/accTime, _pitch]] call FUNC(translateToModelSpace);
				
				_vectorTo = _missilePos vectorFromTo _outVector;
				_missile setVectorDirAndUp [_vectorTo, vectorUp _missile];
			};
			
	#ifdef DEBUG_MODE_FULL
			hintSilent format["d: %1", _distanceToTarget];
	#endif
		};
	};
};


FUNC(guidance_Hellfire_LOAL_HI) = {
	PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	
	GVAR(lastTime) = time;
	[FUNC(guidance_Hellfire_LOAL_HI_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};


FUNC(guidance_Hellfire_LOAL_DIR) = {
	PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
	
	GVAR(lastTime) = time;
	[FUNC(guidance_Hellfire_LOAL_DIR_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
_fireMode = _shooter getVariable ["ACE_FIRE_SELECTION", ACE_DEFAULT_FIRE_SELECTION];

switch (_fireMode select 0) do {
	// Default to FIREMODE_DIRECT_LOAL
	// FIREMODE_DIRECT_LOAL
	default {
		LOG("Initiating Hellfire II FIREMODE_LOAL_DIR");
		_this call FUNC(guidance_Hellfire_LOAL_HI);
	};
};