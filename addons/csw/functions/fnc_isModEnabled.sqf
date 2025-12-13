#include "..\script_component.hpp"
/*
 * Author: tcvm
 * General condition to check if the mod is enabled.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * If the mod is enabled <BOOL>
 *
 * Example:
 * [] call ace_csw_fnc_isModEnabled
 *
 * Public: Yes
 */

GVAR(ammoHandling) > 0 || GVAR(defaultAssemblyMode)
