/**
 * fn_heal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

// TODO replace by event system
[[_caller, _target], QUOTE(DFUNC(treatmentAdvanced_fullHealLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

true;
