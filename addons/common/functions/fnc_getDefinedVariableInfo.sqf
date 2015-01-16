/**
 * fn_getvariableInfo.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"
+(missionNamespace getvariable ["GVAR(OBJECT_VARIABLES_STORAGE)_" + (_this select 0),[]])