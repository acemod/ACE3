/**
 * fn_openScreen_home_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display"];
_deviceName = _this select 0;

[_deviceName] call cse_fnc_clearDeviceScreen_CC;
[_deviceName,"full"] call cse_fnc_setBackground_CC;
[_deviceName,"top"] call cse_fnc_setNavBar_CC;
[_deviceName,"hidden"] call cse_fnc_setSideBar_CC;
[_deviceName,"hidden"] call cse_fnc_setBottomBar_CC;
[_deviceName] call cse_fnc_setProgramIcons_CC;