/**
 * fn_isModuleEnabled_F.sqf
 * @Descr: Check if given CSE Module class is enabled
 * @Author: Glowbal
 *
 * @Arguments: [moduleName STRING]
 * @Return: BOOL Returns true if module is currently enabled
 * @PublicAPI: true
 */

if (isnil "CSE_F_MODULE_OBJ_EH") then {
	CSE_F_MODULE_OBJ_EH = [];
};
((_this select 0) in CSE_F_MODULE_OBJ_EH);