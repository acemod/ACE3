/**
 * fn_hasOpenWounds.sqf
 * @Descr: Check if unit has open wounds
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit to check)]
 * @Return: BOOL
 * @PublicAPI: true
 */

#include "script_component.hpp"

private "_openWounds";
_openWounds = [_this select 0,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);

({(((_x select 0) + (_x select 1) +  (_x select 2)) > 0)}count _openWounds > 0);