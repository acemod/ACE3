/**
 * fn_getClientSideOptionFromProfile_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_default","_settingValue"];
_name = _this select 0;
_default = _this select 1;

_settingValue = profileNamespace getvariable ["cse_f_clientSideSetting_"+_name, _default];

_settingValue