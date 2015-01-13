/**
 * fn_getVersion.sqf
 * @Descr: Get the version number of the current CSE Build
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: STRING String containing the version
 * @PublicAPI: true
 */

getText (configFile >> "cfgPatches" >> "cse_main" >> "version");