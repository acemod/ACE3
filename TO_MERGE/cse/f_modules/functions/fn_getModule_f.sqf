/**
 * fn_getModule_f.sqf
 * @Descr: Gets module information. DEPRECATED
 * @Author: Glowbal
 *
 * @Arguments: [ModuleName STRING]
 * @Return: ARRAY Returns an array with [ModuleName STRING, initLine STRING]
 * @PublicAPI: false
 */

private ["_module","_cfg","_init","_name"];
_moduleName = _this select 0;
_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName);
_module = [];
if (isClass _cfg) then {
	_init = getText (_cfg >> "init");
	_name = getText (_cfg >> "name");
	//_module set [count _module,[_name,_init]];
	_module = [_name,_init];
};

_module