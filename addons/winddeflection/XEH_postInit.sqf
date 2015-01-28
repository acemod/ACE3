/**
 * XEH_postInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (isnil QGVAR(EnableForAI)) then {
	GVAR(EnableForAI) = false;
};
