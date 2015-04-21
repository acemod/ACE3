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
 * Public: No
 */

#include "script_component.hpp"

GVAR(ClientSettingsExportIncluded) = !(GVAR(ClientSettingsExportIncluded));

[] call FUNC(onServerSettingsMenuOpen);
