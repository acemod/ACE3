/**
 * fn_remoteModuleInit.sqf
 * @Descr: Called by remote execution script to initialize modules.
 * @Author: Glowbal
 *
 * @Arguments: [[moduleName STRING, arguments ARRAY (Format: [argumentName STRING, value ANY])], ...]
 * @Return: nil
 * @PublicAPI: false
 */

private ["_toinitalizeModules"];
_toinitalizeModules = _this select 0;
sleep 5;
{
	[format["initalize module through Cfg REMOTE: %1",_x]] call cse_fnc_debug;
	_x call cse_fnc_enableModule_f;
}foreach _toinitalizeModules;
