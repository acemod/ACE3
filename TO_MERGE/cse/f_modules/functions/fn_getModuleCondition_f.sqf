/**
 * fn_getModuleCondition_f.sqf
 * @Descr: N/A DEPRECATED
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_moduleName","_condition","_return","_cfgFile"];

_moduleName = _this select 0;
_return = "";
_cfgFile = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _moduleName);
if (isClass _cfgFile) then {
	_return = format["CSE_MODULE_CONDITION_%1",_moduleName];

};
_return