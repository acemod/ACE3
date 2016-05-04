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

if (local _target) then {
    ["treatmentAdvanced_fullHealLocal", [_caller, _target]] call EFUNC(common,localEvent);
} else {
    ["treatmentAdvanced_fullHealLocal", _target, [_caller, _target]] call EFUNC(common,targetEvent);
};

true;
