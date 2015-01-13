/**
 * fn_getDeviceSettings_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_screenName","_settings"];
_deviceName = _this select 0;
_settings = [0,0,0,0];

if (isnil 'CSE_REGISTERED_DEVICES_CC') then {
	CSE_REGISTERED_DEVICES_CC = [];
};

{
	if ((_x select 0) == _deviceName) exitwith {
		_found = _x select 1;
		if (!CSE_DISPLAY_CC_VIEW_FULL_SCREEN_CC) then {
			_settings = [_found select 0, _found select 1, _found select 2,_found select 3];
		} else {
			_settings = [safezoneX, safezoneY, safezoneW, safezoneH];
		};
	};
}foreach CSE_REGISTERED_DEVICES_CC;

_settings