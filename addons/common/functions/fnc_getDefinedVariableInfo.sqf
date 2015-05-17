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
+(missionNamespace getvariable [QGVAR(OBJECT_VARIABLES_STORAGE_) + (_this select 0),[]])
