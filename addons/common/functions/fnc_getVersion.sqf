#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the version number of the current ACE build.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * ACE Version <STRING>
 *
 * Example:
 * [] call ace_common_fnc_getVersion
 *
 * Public: Yes
 */

getText (configFile >> "CfgPatches" >> "ACE_main" >> "version") // return
