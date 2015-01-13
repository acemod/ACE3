/**
 * fn_openDevice_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName"];
_deviceName = _this select 0;

disableSerialization;
createDialog _deviceName;
CSE_CURRENT_DEVICE_NAME_CC = _deviceName;
CSE_SMALL_SCREEN_DISPLAY_CC = false;
// [_deviceName, 1] spawn cse_fnc_showLoadingScreen_CC;
[_deviceName] call cse_fnc_clearDeviceScreen_CC;
[_deviceName,"full"] call cse_fnc_setBackground_CC;
[_deviceName,"top"] call cse_fnc_setNavBar_CC;
[_deviceName,"hidden"] call cse_fnc_setSideBar_CC;
[_deviceName,[_deviceName] call cse_fnc_getCurrentApplication_CC] call cse_fnc_openScreen_CC;
[_deviceName] call cse_fnc_displayBFT_CC;
