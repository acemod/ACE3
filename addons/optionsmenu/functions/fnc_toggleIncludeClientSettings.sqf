/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * none
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_optionsmenu_fnc_toggleIncludeClientSettings
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(ClientSettingsExportIncluded) = !(GVAR(ClientSettingsExportIncluded));

[] call FUNC(onServerSettingsMenuOpen);
