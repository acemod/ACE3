/*
 * Author: Glowbal
 *
 * Get the version number of the current ACE Build
 *
 * Argument:
 * None
 *
 * Return value:
 * String containing the version(STRING)
 *
 * Public: No
 */
#include "script_component.hpp"
getText (configFile >> "cfgPatches" >> "ACE_main" >> "version");
