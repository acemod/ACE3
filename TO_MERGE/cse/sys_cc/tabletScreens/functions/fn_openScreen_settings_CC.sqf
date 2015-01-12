/**
 * fn_openScreen_settings_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName"];
_deviceName = _this select 0;
[_deviceName] call cse_fnc_clearDeviceScreen_CC;
[_deviceName,"full","black"] call cse_fnc_setBackground_CC;
[_deviceName,"top"] call cse_fnc_setNavBar_CC;