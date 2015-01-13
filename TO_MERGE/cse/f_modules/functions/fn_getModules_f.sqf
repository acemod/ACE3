/**
 * fn_getModules_f.sqf
 * @Descr: Returns all current active CSE Modules
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: ARRAY List of all current Modules [moduleName STRING (Module classname), ...]
 * @PublicAPI: true
 */

if (isnil "CSE_F_MODULE_OBJ_EH") then {
    CSE_F_MODULE_OBJ_EH = [];
};

CSE_F_MODULE_OBJ_EH;