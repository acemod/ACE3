/**
 * fn_viewLiveFeed_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_display","_view","_ctrl", "_camera"];

_view = _this select 0;

disableSerialization;
_deviceName = [] call cse_fnc_getCurrentDeviceName_CC;
[format["fn_viewLiveFeed_CC %1 %2",_this, _deviceName]] call cse_fnc_debug;
_display = uiNamespace getvariable _deviceName;
_ctrl = (_display displayCtrl 20);

if (_view) then {
	_camera = objNull;
	if (isnil "CSE_PIP_CAMERA_CC") then {
		_camera = "camera" camCreate (position player);
		CSE_PIP_CAMERA_CC = _camera;
		_camera cameraEffect ["INTERNAL", "BACK","rendertarget0"];
	} else {
		_camera = CSE_PIP_CAMERA_CC;
		//_camera attachto [vehicle CSE_LIVEFEED_TARGET_CC,[-0.18,0.1,0.1], "head" ];
	};
	[format["VIEW LIVE TARGET: %1 %2", CSE_LIVEFEED_TARGET_CC, _camera]] call cse_fnc_debug;
	"rendertarget0" setPiPEffect [0];
	_ctrl ctrlsettext "#(argb,256,256,1)r2t(rendertarget0,1.0)";
	_ctrl ctrlcommit 0;

} else {
	_ctrl ctrlsettext "";
	_ctrl ctrlcommit 0;
};