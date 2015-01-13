/**
 * fn_setLiveFeedTarget_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define QUAD_COPTER_POS	[0,0,-0.5]
#define LARGE_UAV_POS	[0,0.5,-1.0]
#define GAV_POS			[0,0,1]

private ["_target", "_camera", "_cameraAttachToPos"];
_target = _this select 0;
CSE_LIVEFEED_TARGET_CC = _target;

[format["Setting live feed target: %1",_this]] call cse_fnc_debug;

if (isNull _target) then {
	[false] call cse_fnc_viewLiveFeed_CC;
} else {
	_camera = objNull;
	if (isnil "CSE_PIP_CAMERA_CC") then {
		_camera = "camera" camCreate (position _target);
		CSE_PIP_CAMERA_CC = _camera;
		_camera cameraEffect ["INTERNAL", "BACK", "rendertarget11"];
	} else {
		if (isNull CSE_PIP_CAMERA_CC) then {
			["LiveFeed Camera was null. Creating a new one."] call cse_fnc_debug;
			_camera = "camera" camCreate (position _target);
			CSE_PIP_CAMERA_CC = _camera;
			_camera cameraEffect ["INTERNAL", "BACK", "rendertarget11"];
		};
		_camera = CSE_PIP_CAMERA_CC;
	};
	detach _camera;
	if (_target isKindOf "CaManBase") then {
		_camera attachto [_target,[-0.18,0.1,0.1], "head"];

		[_target, _camera] spawn {
			_target = _this select 0;
			_camera = _this select 1;
			while {((alive _target) && (CSE_LIVEFEED_TARGET_CC == _target) && alive _camera && dialog)} do {
				if (vehicle _target != _target) then {
					_positionInWorld = _target modelToWorld (_target selectionPosition  "head");
				 	_vehPos = (vehicle _target) worldToModel _positionInWorld;
				 	_camera attachTo [(vehicle _target),_vehPos];
				} else {
					_camera attachto [_target,[-0.18,0.1,0.1], "head"];
				};
			};
		};

	} else {
		if ((_target in allUnitsUAV)) then {
			// TODO Make this dynamic through an array.
			_cameraAttachToPos = switch (typeOf _target) do {
			    case "B_UAV_01_F": {
					QUAD_COPTER_POS;
			    };
			    case "B_UAV_02_CAS_F": {
					LARGE_UAV_POS;
			    };
				case "B_UAV_02_F": {
					LARGE_UAV_POS;
			    };
			    case "B_UGV_01_F": {
					GAV_POS;
			    };
				case "B_UGV_01_rcws_F": {
					GAV_POS;
			    };

			    case "O_UAV_01_F": {
					QUAD_COPTER_POS;
			    };
			    case "O_UAV_02_CAS_F": {
					LARGE_UAV_POS;
			    };
				case "O_UAV_02_F": {
					LARGE_UAV_POS;
			    };
			    case "O_UGV_01_F": {
					GAV_POS;
			    };
				case "O_UGV_01_rcws_F": {
					GAV_POS;
			    };

			    case "I_UAV_01_F": {
					QUAD_COPTER_POS;
			    };
			    case "I_UAV_02_CAS_F": {
					LARGE_UAV_POS;
			    };
				case "I_UAV_02_F": {
					LARGE_UAV_POS;
			    };
			    case "I_UGV_01_F": {
					GAV_POS;
			    };
				case "I_UGV_01_rcws_F": {
					GAV_POS;
			    };
			    default {
			        QUAD_COPTER_POS;
			    };
			};

			_camera attachto [_target,_cameraAttachToPos];
		};
	};
};