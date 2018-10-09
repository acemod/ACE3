#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 * 2: SelectionName <STRING>
 * 3: ClassName <STRING>
 * 4: Item <UNKNOWN>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [bob, kevin, "selection", "classname", ] call ACE_medical_fnc_treatmentAdvanced_fullHeal
 *
 * Public: No
 */

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (local _target) then {
    [QGVAR(treatmentAdvanced_fullHealLocal), [_caller, _target]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentAdvanced_fullHealLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;
};

true;
