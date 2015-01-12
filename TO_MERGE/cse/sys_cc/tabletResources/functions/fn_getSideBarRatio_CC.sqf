/**
 * fn_getSideBarRatio_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl"];
_deviceName = _this select 0;

_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_navBarSettings = [_deviceName] call cse_fnc_getNavBarRatio_CC;

_sideBarFullScreen = {
	private["_deviceName","_cfg","_allowSideBar"];
	_deviceName = _this select 0;

	_allowSidebar = 0;
	if (isnil 'CSE_REGISTERED_DEVICES_CC') then {
		CSE_REGISTERED_DEVICES_CC = [];
	};

	{
		if (_x select 0 == _deviceName) exitwith {
			_allowSidebar = _x select 2;
		};
	}foreach CSE_REGISTERED_DEVICES_CC;
	_allowSidebar
};

_sideBarN = ([_deviceName] call _sideBarFullScreen);
_return = switch (_sideBarN) do {
	case 1: {[(_settings select 0) + ((_settings select 2)-((_settings select 2) / 4.5)), (_settings select 1) + (_navBarSettings select 3)/2, (_settings select 2)/4.5, (_settings select 3) - (_navBarSettings select 3)/2]};
	case 2: {[(_settings select 0) + ((_settings select 2)-((_settings select 2) / 1.5)), (_settings select 1)+ (_navBarSettings select 3)/2, (_settings select 2)/1.5, (_settings select 3) - (_navBarSettings select 3)/2]};
	case 3: {[_settings select 0, (_settings select 1)+ (_navBarSettings select 3)/2, _settings select 2, (_settings select 3) - (_navBarSettings select 3)/2]};
	default {[0,0,0,0]};
};

_return