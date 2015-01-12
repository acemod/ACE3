/**
 * fn_getLastScreen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_lastScreen"];
_deviceName = _this select 0;
	_lastScreen = player getvariable ["cse_cc_lastScreen_" + _deviceName, "home"];

_lastScreen
