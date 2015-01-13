/**
 * fn_setMap_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl","_newPos"];
_deviceName = _this select 0;
_selected = _this select 1;
_pos = _this select 2;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;

disableSerialization;
_display = uiNamespace getvariable _deviceName;

_idc = switch (_selected) do {
	case "main": {10};
	case "sidebar": {11};
	default {10};
};

_ctrl = (_display displayCtrl _idc);

_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_navBarHeight = _navBarRatio select 3;
_sideBarWidth = _sideBarRatio select 2;


_fullScreenSideBar = [_settings select 0,(_settings select 1) + _navBarHeight,  (_settings select 2) - _sideBarWidth, (_settings select 3) -  (_navBarHeight*2)];
_fullScreenNoSideBar = [_settings select 0,(_settings select 1) + _navBarHeight,  (_settings select 2), (_settings select 3) - (_navBarHeight*2)];

_newPos = switch (_pos) do {
	case "full": {
		[_deviceName,"show"] call cse_fnc_setBottomBar_CC;
		if ([_deviceName] call cse_fnc_isSideBarOpen_CC) then {
			_fullScreenSideBar
		} else {
			_fullScreenNoSideBar
		};
	};
	default { /* includes hidden */
		[_deviceName,"hidden"] call cse_fnc_setBottomBar_CC;
		[0,0,0,0]
	};
};
if (_selected == "sidebar") then {
	_sideBarMapWidth = _sideBarWidth - 0.02;
	_sideBarMapHeight = ((_sideBarRatio select 3) / 12) * 2;
	_newPos = switch (_pos) do {
		case "top": {[(_sideBarRatio select 0) + 0.01 , (_settings select 1) + _navBarHeight + _sideBarMapWidth,_sideBarMapWidth, _sideBarMapHeight]};
		case "center": {[(_sideBarRatio select 0) + 0.01, (_settings select 1) + (_sideBarRatio select 3) - _sideBarMapWidth*2,_sideBarMapWidth, _sideBarMapHeight]};
		case "bottom": {[(_sideBarRatio select 0) + 0.01, (_settings select 1) + (_sideBarRatio select 3) - _sideBarMapWidth,_sideBarMapWidth, _sideBarMapHeight]};
		case "hidden": {[0,0,0,0]};
		default {[0,0,0,0]};
	};
	if (_pos == "invisable" || _pos == "visable") then {
		_newPos = ctrlPosition _ctrl;
		if (_pos == "invisable") then {
			_ctrl ctrlShow false;
		} else {
			_ctrl ctrlShow true;
		};
	};
};
_ctrl ctrlsetPosition _newPos;
_ctrl ctrlCommit 0;
_ctrl ctrlEnable true;
if (_selected == "sidebar" && !(_pos == "visable" || _pos == "invisable" || _pos == "hidden")) then {
	if ([_deviceName] call cse_fnc_isSideBarOpen_CC) then {
		[_deviceName,"sidebar","visable"] call cse_fnc_setMap_CC;
	} else {
		[_deviceName,"sidebar","invisable"] call cse_fnc_setMap_CC;
	};
};
_ctrl