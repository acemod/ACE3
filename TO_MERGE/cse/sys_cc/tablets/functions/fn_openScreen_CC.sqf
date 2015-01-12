/**
 * fn_openScreen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_screenName","_init","_cfg", "_availablePrograms"];
_deviceName = _this select 0;
_screenName = _this select 1;


[format["CC - openScreen: %1 test",_screenName],2] call cse_fnc_debug;
[_deviceName,"full"] call cse_fnc_setBackground_CC;
_availablePrograms = [];
_cfg = (missionConfigFile >> "Combat_Space_Enhancement" >> "command_and_control" >> "applications" >> _screenName);

_found = false;
{
	if ((_x select 0) == _screenName) exitwith {
		[_deviceName] call compile (_x select 6);
		_found = true;
	};
}foreach CSE_REGISTERED_APPLICATIONS_CC;

if (_found) then {
	//_init = getText (_cfg>> "init");
	//[_deviceName] spawn compile _init;
} else {
	[_deviceName] spawn cse_fnc_openScreen_home_CC;
	_screenName = "home";
	[_deviceName,"show"] call cse_fnc_setBottomBar_CC;
};


CSE_PREVIOUS_APPLICATION_CC = [_deviceName] call cse_fnc_getCurrentApplication_CC;
//CSE_CURRENT_APPLICATION_CC = _screenName;
call compile format["CSE_CURRENT_APPLICATION_%1_CC = '%2';",_deviceName,_screenName];


//player sidechat format[" Current Application is set to: %1",call compile format["CSE_CURRENT_APPLICATION_%1_CC",_deviceName]];
if ([_deviceName] call cse_fnc_isSideBarOpen_CC) then {
	[_deviceName,"right"] call cse_fnc_setSideBar_CC;
};
//player setvariable ["cse_cc_lastScreen_" + _deviceName, _screenName];