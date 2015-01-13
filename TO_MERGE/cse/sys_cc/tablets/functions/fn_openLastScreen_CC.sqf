/**
 * fn_openLastScreen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName"];
_deviceName = _this select 0;

[_deviceName,[_deviceName] call cse_fnc_getLastScreen_CC] call cse_fnc_openScreen_CC;
