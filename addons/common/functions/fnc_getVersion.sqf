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
 * Public: Yes
 */
#include "script_component.hpp"

getText (configFile >> "CfgPatches" >> "ACE_main" >> "version") // return
