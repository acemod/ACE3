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
    [QGVAR(treatmentAdvanced_fullHealLocal), [_caller, _target]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentAdvanced_fullHealLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;
};

true;
