//#define DEBUG_MODE_FULL
#include "script_component.hpp"

TRACE_1("enter", _this);

FUNC(magnitude) = {
	 _this distance [0, 0, 0]
};

FUNC(mat_normalize3d) = {
	private ["_mag"];
	PARAMS_3(_vx,_vy,_vz);

	_mag = _this call FUNC(magnitude);
	if (_mag == 0) then {_mag = 1};
	[(_vx/_mag), (_vy/_mag), (_vz/_mag)]
};

FUNC(laserHudDesignatePFH) = {
	_args = _this select 0;
	_laserTarget = _args select 0;
	_shooter = _args select 1;
	
	_vehicle = vehicle _shooter;
	_weapon = currentWeapon _vehicle;
	
	if(!alive _shooter || isNull _vehicle || isNull _laserTarget || !GVAR(laserActive) ) exitWith { 
		[(_this select 1)] call cba_fnc_removePerFrameHandler; 
	};
	
	// Retrieve the gunner and turret memory point information
	_gunnerInfo = [_vehicle, _weapon] call CBA_fnc_getFirer;
	
	_turret = [_vehicle, _gunnerInfo select 1] call CBA_fnc_getTurret;
	_pov = getText (_turret >> "memoryPointGunnerOptics");
	_gunBeg = getText (_turret >> "gunBeg");
	_gunEnd = getText (_turret >> "gunEnd");	
	TRACE_3("", _pov, _gunBeg, _gunEnd);

	// Pull the PIP pov or barrel direction, depending on how the model is set up
	_povPos = ATLtoASL ( _vehicle modelToWorld (_vehicle selectionPosition _pov ) );
	_povDir = [0,0,0];
	if(_pov == "pip0_pos") then {
		_pipDir = ATLtoASL ( _vehicle modelToWorld (_vehicle selectionPosition "pip0_dir" ) ); 
		_povDir = [_povPos, _pipDir] call BIS_fnc_vectorDiff;
	} else {
		_gunBeginPos = ATLtoASL ( _vehicle modelToWorld (_vehicle selectionPosition _gunBeg ) );
		_gunEndPos = ATLtoASL ( _vehicle modelToWorld (_vehicle selectionPosition _gunEnd ) );
		_povDir = [_gunEndPos, _gunBeginPos] call BIS_fnc_vectorDiff;
	};
	
	TRACE_4("", _povDir, _povPos, _gunBeginPos, _gunEndPos);
	
	_result = [_povPos, _povDir] call EFUNC(laser,shootCone);
	
	if((count _result) > 0) then {
		_resultPositions = _result select 2;

		if((count _resultPositions) > 0) then {
			_firstResult = _resultPositions select 0;
			_pos = _firstResult select 0;
			
			// If the laser has moved less than a half meter, then dont move it.
			// Just regular use of lasers will commonly make them move this much,
			// but not across multiple close frames.
			// This loses accuracy a little, but saves position updates per frame.
			//if( ((getPosASL _laserTarget) distance _pos) > 0.5) then {
				_laserTarget setPosATL (ASLToATL _pos);
			//};
#ifdef DEBUG_MODE_FULL
			drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToATL _pos, 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
#endif
		};
	};
};

if(isNil QGVAR(laser)) then {
	_laserTarget = "LaserTarget" createVehicle (getpos player);
	
	GVAR(laserActive) = true;
	
	_handle = [FUNC(laserHudDesignatePFH), 0, [_laserTarget, player]] call cba_fnc_addPerFrameHandler;
	_laserTarget setVariable ["ACE_PFH_HANDLE", _handle, false];
	
	GVAR(laser) = _laserTarget;
} else {
	[] call FUNC(laserHudDesignateOff);
	[] call FUNC(laserHudDesignateOn);
};

