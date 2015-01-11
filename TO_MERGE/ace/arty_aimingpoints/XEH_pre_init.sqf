#include "script_component.hpp"

ADDON = false;

PREP(menuDef_stake);
PREP(menuDef_stake_self);

PREP(isKindOf);

PREP(onPickupStake);
PREP(onPlaceStake);
PREP(onModifyStake);

PREP(onPlaceStakeConfirm);
PREP(onPlaceStakeCancel);

ACE_ARTY_COLLIMATORS = [];
ACE_ARTY_COLLIMATORS_PFH_ID = -1;

FUNC(milsFromGunBarrel) = {
	private "_gunDir";
	PARAMS_2(_gun,_obj);
	// TODO: get relative directoin of placement from barrel in mils
};

FUNC(findGun) = {
	private["_detectorPos", "_distance", "_target","_targets","_closeDist"];
	_target = objNull;
	_detectorPos = [0, 0, 0];
	
	for [
		{_distance = 10},
		{(_distance <= viewdistance) && ((_detectorPos select 2) > -2) && isNull _target},
		{_distance = _distance + 10}
	] do {
		_detectorPos = positionCameraToWorld [0, 0, _distance];
		_targets = _detectorPos nearEntities ["StaticWeapon", 10];
		
		if (count _targets > 0) exitWith {
			private["_closeDist", "_dist"];
			_closeDist = 9999;
			{
				private["_gun"];
				_gun = _x;
				_dist = player distance _gun;
				if(_dist < _closeDist) then {
					_closeDist = _dist;
					_target = _gun;
				};
			} forEach _targets;
			_target
		};
	};
	_target
};

FUNC(collimatorHandler) = {
	_gp = positionCameraToWorld [0,0,0];
	_gp set[2, getTerrainHeightASL [_gp select 0, _gp select 1]];
	_nearCollimators = (positionCameraToWorld [0,0,0]) nearEntities ["ACE_Arty_M1A1_Collimator", 20];
	_moved = false;
	{
		_lastPos = _x getVariable [QGVAR(colLastPos), [0,0,0]];
		if(_lastPos distance (getPosASL _x) > 0) exitWith {
			_moved = true;
		};
	} forEach _nearCollimators;
	_proxies = (positionCameraToWorld [0,0,0]) nearEntities ["ACE_Arty_Collimator_Proxy", 20];
	if((count _proxies) != (count _nearCollimators)) then {
		_moved = true;
	};
	if(_moved) then {
		ACE_ARTY_COLLIMATORS = [];
		{
			deleteVehicle _x;
		} forEach _proxies;
	};
	_newCollimators = _nearCollimators - ACE_ARTY_COLLIMATORS;
	{
		// player sideChat format["creating proxyaaaa"];
		_collimatorProxy = "ACE_Arty_Collimator_Proxy" createVehicleLocal (getPos _x);
		_collimatorProxy setDir 180;
		_collimatorProxy attachTo [_x, [0,0,0], "optic_proxy"];
		_x setVariable ["ace_collimator_proxy", _collimatorProxy];
	} forEach _newCollimators;
	_oldCollimators = ACE_ARTY_COLLIMATORS - _nearCollimators;
	{
		// player sideChat format["deleting proxy"];
		_collimatorProxy = _x getVariable "ace_collimator_proxy";
		detach _collimatorProxy;
		deleteVehicle _collimatorProxy;
	} forEach _oldCollimators;
	ACE_ARTY_COLLIMATORS = _nearCollimators;
	{
		_collimatorProxy = _x getVariable "ace_collimator_proxy";
		_x setVariable [QGVAR(colLastPos), (getPosASL _x)];
		_cp = _collimatorProxy modelToWorld (_collimatorProxy selectionPosition "optic");
		_cp set[2, getTerrainHeightASL [_cp select 0, _cp select 1]];
		_dis =  (_gp distance _cp);
		_disDif = 0.59-(_dis * 0.062);
		_collimatorProxy animate["expand_ul", _disDif];
		_collimatorProxy animate["expand_ur", _disDif];
		_collimatorProxy animate["expand_ll", _disDif];
		_collimatorProxy animate["expand_lr", _disDif];
		_offset = 0;
		_relDir = [_collimatorProxy, _gp] call BIS_fnc_relativeDirTo;
		_relDir = (_relDir-180);
		_relDir = DEG2MIL(_relDir);
		_cf = -0.0011*(_dis^2) + 0.1335*_dis - 1.005;
		_relDir = _relDir + (_relDir*_cf);
		_collimatorProxy animate["offset", _relDir];
		_colRot = _x animationPhase "rotate_optic";
		_collimatorProxy setDir MIL2DEG(_colRot);
		// player sideChat format["ds: %1", _colRot];
		// _wepVec = (vehicle player) weaponDirection ((weapons (vehicle player)) select 0);
		// _wepDir = (_wepVec call CBA_fnc_vect2polar) select 1;
		// _wepDir = DEG2MIL(_wepDir);
		// player sideChat format["_wepDir: %1", _wepDir];
	} forEach ACE_ARTY_COLLIMATORS;
};

FUNC(startCollimatorHandler) = {
	ACE_ARTY_COLLIMATORS = [];
	ACE_ARTY_COLLIMATORS_PFH_ID = [FUNC(collimatorHandler), 0.0, []] call CBA_fnc_addPerFrameHandler;
};

FUNC(endCollimatorHandler) = {
	{
		_collimatorProxy = _x getVariable "ace_collimator_proxy";
		detach _collimatorProxy;
		deleteVehicle _collimatorProxy;
	} forEach ACE_ARTY_COLLIMATORS;
	[ACE_ARTY_COLLIMATORS_PFH_ID] call CBA_fnc_removePerFrameHandler;
	ACE_ARTY_COLLIMATORS = [];
};

FUNC(onAlignCollimator) = {
	// player sideChat format["lol"];
	GVAR(aligningCollimator) = _this select 0;
	_pos = GVAR(aligningCollimator) modelToWorld (GVAR(aligningCollimator) selectionPosition "sight_begin");
	_camera = "camera" camCreate _pos;
	_camera cameraEffect ["internal", "back"];
	_camera camSetTarget (GVAR(aligningCollimator) modelToWorld (GVAR(aligningCollimator) selectionPosition "sight_end"));
	_camera camSetFov 0.2;
	_camera camCommit 0.1;
	
	
	showCinemaBorder false;
	GVAR(collimatorAlignHorz) = GVAR(aligningCollimator) animationPhase "rotate_optic";
	GVAR(collimatorAlignVert) = GVAR(aligningCollimator) animationPhase "elevate_optic";
	[] call FUNC(addKeys);
	_func = {
		_camera = (_this select 0) select 0;
		if(GVAR(aligning)) then {
			_pos = GVAR(aligningCollimator) modelToWorld (GVAR(aligningCollimator) selectionPosition "sight_begin");
			_camera camSetPos _pos;
			_camera camSetTarget (GVAR(aligningCollimator) modelToWorld (GVAR(aligningCollimator) selectionPosition "sight_end"));
			camUseNVG ace_sys_nvg_on;
			_camera camSetFov 0.2;
			_camera camCommit 0.1;
		} else {
			_camera cameraEffect ["terminate", "back"];
			cutrsc ["default", "PLAIN DOWN"];
			camDestroy _camera;
			[] call FUNC(removeKeys);
			[(_this select 1)] call CBA_fnc_removePerFrameHandler;
		};
	};
	GVAR(aligning) = true;
	[_func, 0.05, [_camera]] call CBA_fnc_addPerFrameHandler;
};

FUNC(addKeys) = {
	GVAR(key_dn) = (findDisplay 46) displayAddEventHandler["KeyDown", '["KeyDown", _this] call FUNC(keyEvent)'];
	GVAR(key_up) = (findDisplay 46) displayAddEventHandler["KeyUp", '["KeyUp", _this] call FUNC(keyEvent)'];
};

FUNC(removeKeys) = {
	(findDisplay 46) displayRemoveEventhandler ["KeyDown", GVAR(key_dn)];
	(findDisplay 46) displayRemoveEventhandler ["KeyUp", GVAR(key_up)];
};

FUNC(keyEvent) = {
	_event = _this select 0;
	_parameters = _this select 1;

	if (GVAR(presstime) == time) exitwith {false};
	GVAR(presstime) = time;
	switch(_event) do {
		case "KeyDown": {
			_key = _parameters select 1;
			switch(_key) do {
				case 0xCD: { GVAR(collimatorAlignHorz) = GVAR(collimatorAlignHorz) + 0.25; };
				case 0xCB: { GVAR(collimatorAlignHorz) = GVAR(collimatorAlignHorz) - 0.25; };
				case 0xD0: { GVAR(collimatorAlignVert) = GVAR(collimatorAlignVert) + 0.25; };
				case 0xC8: { GVAR(collimatorAlignVert) = GVAR(collimatorAlignVert) - 0.25; };
				case 1:  { GVAR(aligning) = false; };
			};
		};
	};
	if ((GVAR(aligningCollimator) animationPhase "rotate_optic") != GVAR(collimatorAlignHorz)) then {
		GVAR(aligningCollimator) animate ["rotate_optic", GVAR(collimatorAlignHorz)];
	};
	if ((GVAR(aligningCollimator) animationPhase "elevate_optic") != GVAR(collimatorAlignVert)) then {
		GVAR(aligningCollimator) animate ["elevate_optic", GVAR(collimatorAlignVert)];
	};
	!(GVAR(aligning))
};

GVAR(placingStake) = false;



/*
AIMING CIRCLE CODE
*/

GVAR(aimingCircleViewIndex) = 1;
GVAR(aimingCircleCurrentViews) = nil;
GVAR(aimingCircleCurrentDeflection) = 0;
GVAR(aimingCircleCurrentDeflectionFine) = 0;

GVAR(aimingCircleCurrentElevation) = 0;
GVAR(aimingCircleCurrentElevationFine) = 0;

GVAR(aimingCircleCurrentOrientation) = 0;


GVAR(aimingCircleMainViews) = [
	[["view_elevation", "gunEnd"], 0.5, 0, [], 0, [], 0],
	["gunnerview", 0.5, 0, [], 0, [], 0],
	[["view_deflection", "centerpoint"], 0.45, 0, [], 0, [], 0],
	[["view_needle", "view_target_reticle"], 0.44, 0, [], 0, [], 0]
];
							
//
GVAR(currentAimingCircle) = nil;
GVAR(aimingCircleCam) = nil;
GVAR(aimingCircleDisplayOpen) = false;
GVAR(aimingCircleActionIds) = [];
GVAR(aimingCircleLights) = [];
GVAR(aimingCircleLightLoopPid) = [] spawn { };


FUNC(aimingCircleGetOut) = {
	PARAMS_3(_circle,_pos,_unit);

	if (_unit == player) then {
		{
			GVAR(currentAimingCircle) removeAction _x;
		} forEach GVAR(aimingCircleActionIds);
		_needleUnlocked = GVAR(currentAimingCircle) getVariable[QGVAR(aimingCircleNeedleUnlocked), false];
		if(_needleUnlocked) then {
			GVAR(currentAimingCircle) setVariable[QGVAR(aimingCircleNeedleUnlocked), false];
		};
		GVAR(aimingCircleActionIds) = [];
		GVAR(currentAimingCircle) = nil;
	};
};

FUNC(aimingCircleCloseDisplay) = {
	GVAR(aimingCircleCam) cameraEffect ["terminate", "back"];
	cutrsc ["default", "PLAIN DOWN"];
	camDestroy GVAR(aimingCircleCam);
	GVAR(aimingCircleCam) = nil;
	GVAR(currentAimingCircle) switchCamera "INTERNAL";
	GVAR(aimingCircleDisplayOpen) = false;
};
	
FUNC(aimingCircleInitDisplay) = {
	GVAR(aimingCircleDisplayOpen) = true;
	[GVAR(aimingCircleMainViews), GVAR(aimingCircleViewIndex)] call FUNC(aimingCircleSetView);
};

FUNC(aimingCircleSetView) = {
	_views = _this select 0;
	GVAR(aimingCircleCurrentViews) = _views;
	_index = _this select 1;
	_selectedView = _views select _index;
	if(IS_ARRAY((_selectedView select 0))) then {
		GVAR(currentAimingCircle) switchCamera "INTERNAL";
		_viewPositions = _selectedView select 0;
		_snap = false;
		_camPos = (GVAR(currentAimingCircle) modelToWorld (GVAR(currentAimingCircle) selectionPosition (_viewPositions select 0)));
		_targetPos = (GVAR(currentAimingCircle) modelToWorld (GVAR(currentAimingCircle) selectionPosition (_viewPositions select 1)));
		if (isNil QGVAR(aimingCircleCam)) then {
			GVAR(aimingCircleCam) = "camera" camCreate _camPos;
			_snap = true;
			showCinemaBorder false;
		};
		preloadCamera _targetPos;
		5 preloadObject GVAR(currentAimingCircle);
		GVAR(aimingCircleCam) camPreload 5;
		GVAR(aimingCircleCam) camSetPos _camPos;
		GVAR(aimingCircleCam) cameraEffect ["internal", "back"];
		GVAR(aimingCircleCam) camSetTarget _targetPos;
		GVAR(aimingCircleCam) camSetFov (_selectedView select 1);
		if(_snap) then {
			GVAR(aimingCircleCam) camCommit 0;
		} else {
			GVAR(aimingCircleCam) camCommit (_selectedView select 2);
		};
	} else {
		GVAR(aimingCircleCam) cameraEffect ["terminate", "back"];
		cutrsc ["default", "PLAIN DOWN"];
		camDestroy GVAR(aimingCircleCam);
		GVAR(aimingCircleCam) = nil;
		if((_selectedView select 0) == "gunnerview") then {
			GVAR(currentAimingCircle) switchCamera "GUNNER";
		};
	};
};

FUNC(aimingCircleHandleAdjustKey) = {
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_orient = false;
	if(GVAR(currentAimingCircle) animationPhase "right_cover" == 1) then {
		_orient = true;
	};
	
	if(_key == 205 || {_key == 203}) then {
		if(!_shift) then {
			_amount = 1;
			if(_ctrl) then {
				_amount = 0.25;
			};
			if(_key == 203) then {
				_amount = _amount*-1;
			};
			if(_orient) then {
				GVAR(aimingCircleCurrentOrientation) = GVAR(aimingCircleCurrentOrientation) + _amount;
				GVAR(currentAimingCircle) animate ["MainTurret", GVAR(aimingCircleCurrentOrientation)];
				GVAR(currentAimingCircle) animate ["orienting_knobs", GVAR(aimingCircleCurrentOrientation)];
			} else {
				GVAR(aimingCircleCurrentDeflectionFine) = GVAR(aimingCircleCurrentDeflectionFine) + _amount;
				GVAR(aimingCircleCurrentDeflection) = GVAR(aimingCircleCurrentDeflection) + _amount;
				GVAR(currentAimingCircle) animate ["upper_motion", GVAR(aimingCircleCurrentDeflection)];
				GVAR(currentAimingCircle) animate ["deflection_knob", GVAR(aimingCircleCurrentDeflectionFine)];
			};
		} else {
			_amount = 100;
			if(_key == 203) then {
				_amount = _amount*-1;
			};
			if(_orient) then {
				_currentPhase = GVAR(currentAimingCircle) animationPhase "MainTurret";
				if(_currentPhase == GVAR(aimingCircleCurrentOrientation)) then {
					GVAR(aimingCircleCurrentOrientation) = GVAR(aimingCircleCurrentOrientation) + _amount;
					GVAR(currentAimingCircle) animate ["MainTurret", GVAR(aimingCircleCurrentOrientation)];
					GVAR(currentAimingCircle) animate ["orienting_knobs", GVAR(aimingCircleCurrentOrientation)];
				};
			} else {
				_currentPhase = GVAR(currentAimingCircle) animationPhase "upper_motion";
				if(_currentPhase == GVAR(aimingCircleCurrentDeflection)) then {
					GVAR(aimingCircleCurrentDeflection) = GVAR(aimingCircleCurrentDeflection) + _amount;
					GVAR(currentAimingCircle) animate ["upper_motion", GVAR(aimingCircleCurrentDeflection)];
					GVAR(currentAimingCircle) animate ["deflection_knob_coarse", (GVAR(currentAimingCircle) animationPhase "deflection_knob_coarse")+(_amount/100)];
				};
			};
		};
	};
};

FUNC(aimingCircleHandleKey) = {
	_key = _this select 1;
	_move = false;
	if(_key in [203, 205, 200, 208]) then {
		_this call FUNC(aimingCircleHandleAdjustKey);
	} else {
		if(_key in (actionKeys "MoveForward")) then {
			GVAR(aimingCircleViewIndex) = (GVAR(aimingCircleViewIndex) - 1) max 0;
			_move = true;
		};
		if(_key in (actionKeys "MoveBack")) then {
			GVAR(aimingCircleViewIndex) = (GVAR(aimingCircleViewIndex) + 1) min ((count GVAR(aimingCircleCurrentViews))-1);
			_move = true;
		};
		if(_move) then {
			[GVAR(aimingCircleMainViews), GVAR(aimingCircleViewIndex)] call FUNC(aimingCircleSetView);
		};
	};
};

FUNC(aimingCircleMonitor) = {
	if(player in GVAR(currentAimingCircle)) then {
		if(cameraView == "GUNNER") then {
			if(!GVAR(aimingCircleDisplayOpen)) then {
				createDialog "ace_sys_aimingpoints_aimingCircleDisplay";
			};
		};
		if(GVAR(aimingCircleDisplayOpen)) then {
			[GVAR(aimingCircleMainViews), GVAR(aimingCircleViewIndex)] call FUNC(aimingCircleSetView);
		};
		_needleUnlocked = GVAR(currentAimingCircle) getVariable[QGVAR(aimingCircleNeedleUnlocked), false];
		if(_needleUnlocked) then {
			_currentAzi = GVAR(currentAimingCircle) getVariable[QGVAR(aimingCircleCurrentAzi), 0];
			_currentDir = (getDir GVAR(currentAimingCircle));
			if(_currentDir != _currentAzi) then {
				GVAR(currentAimingCircle) setVariable[QGVAR(aimingCircleCurrentAzi), _currentDir, true];
				GVAR(currentAimingCircle) animate ["compass_needle", _currentDir];
			};
		};
	} else {
		[(_this select 1)] call CBA_fnc_removePerFrameHandler;
	};
};

FUNC(aimingCircleHandleLight) = {
	_ac = _this select 0;
	_state = _this select 1;
	if(_state) then {
		_light = "#lightPoint" createVehicleLocal [0,0,0];
		_light lightAttachObject [_ac, [0,0,2]];
		_light setLightBrightness 0.005;
		_light setLightAmbient[1, 0.5, 0.5];
		_light setLightColor[1, 0.5, 0.5];
		GVAR(aimingCircleLights) set[(count GVAR(aimingCircleLights)), [_ac, _light]];
		_ac setVariable [QGVAR(aimingCircleLightPoint), _light];
		if(scriptDone GVAR(aimingCircleLightLoopPid)) then {
			GVAR(aimingCircleLightLoopPid) = [] spawn FUNC(aimingCircleLightLoop);
		};
	} else {
		_lightObj = _ac getVariable QGVAR(aimingCircleLightPoint);
		_ac setVariable [QGVAR(aimingCircleLightPoint), nil];
		deleteVehicle _lightObj;
	};
};

FUNC(aimingCircleLightLoop) = {
	while { (count GVAR(aimingCircleLights)) > 0 } do {
		_tempArray = [];
		{
			_ac = _x select 0;
			_light = _x select 1;
			if(!alive _ac) then {
				deleteVehicle _light;
			} else {
				if(alive _light) then {
					_tempArray set[(count _tempArray), _x];
				};
			};		
		} forEach GVAR(aimingCircleLights);
		GVAR(aimingCircleLights) = _tempArray;
		sleep 0.1;
	};
};

FUNC(aimingCircleGetIn) = {
	PARAMS_3(_circle,_pos,_unit);

	if (_unit == player) then {
		GVAR(currentAimingCircle) = _circle;
		[FUNC(aimingCircleMonitor), 0] call CBA_fnc_addPerFrameHandler;
		_actionId = GVAR(currentAimingCircle) addAction ["Uncover Orienting Knobs", QPATHTO_C(fnc_uncoverKnobs.sqf), [], -100, false, true, "", "gunner _target == player && {(_target animationPhase 'right_cover') == 0}"];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
		_actionId = GVAR(currentAimingCircle) addAction ["Cover Orienting Knobs", QPATHTO_C(fnc_coverKnobs.sqf), [], -100, false, true, "", "gunner _target == player && {(_target animationPhase 'right_cover') == 1}"];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
		_actionId = GVAR(currentAimingCircle) addAction ["Unlock Compass Needle", QPATHTO_C(fnc_needle.sqf), [], -100, false, true, "", format["gunner _target == player && !(_target getVariable[""%1"", false])", QGVAR(aimingCircleNeedleUnlocked)]];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
		_actionId = GVAR(currentAimingCircle) addAction ["Lock Compass Needle", QPATHTO_C(fnc_needle.sqf), [], -100, false, true, "", format["gunner _target == player && (_target getVariable[""%1"", false])", QGVAR(aimingCircleNeedleUnlocked)]];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
		_actionId = GVAR(currentAimingCircle) addAction ["Turn On Lamp", QPATHTO_C(fnc_lamp.sqf), [], -100, false, true, "", format["gunner _target == player && !(_target getVariable[""%1"", false])", QGVAR(aimingCircleLampOn)]];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
		_actionId = GVAR(currentAimingCircle) addAction ["Turn Off Lamp", QPATHTO_C(fnc_lamp.sqf), [], -100, false, true, "", format["gunner _target == player && (_target getVariable[""%1"", false])", QGVAR(aimingCircleLampOn)]];
		GVAR(aimingCircleActionIds) set[(count GVAR(aimingCircleActionIds)), _actionId];
	};
};

FUNC(aimingCircleInit) = {
	_ac = _this select 0;
	_ac setVectorUp [0,0,0.000001];
};

ADDON = true;