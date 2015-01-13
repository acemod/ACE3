/**
 * fn_getNavBarRatio_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings"];
_deviceName = _this select 0;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_settings set[3,(_settings select 3) / 13];

_settings