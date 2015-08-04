/**
 * fn_getVersion.sqf
 * @Descr: Get the version number of the current ACE Build
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: STRING String containing the version
 * @PublicAPI: true
 */
#include "script_component.hpp"
getText (configFile >> "cfgPatches" >> "ACE_main" >> "version");
