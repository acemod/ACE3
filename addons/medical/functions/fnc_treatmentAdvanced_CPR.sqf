#include "script_component.hpp"
/*
 * Author: Glowbal
 * Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [medic, patient, "selectionName", "bandage"] call ace_medical_fnc_treatmentAdvanced_CPR
 *
 * Public: Yes
 */

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (alive _target && {(_target getVariable [QGVAR(inCardiacArrest), false] || _target getVariable [QGVAR(inReviveState), false])}) then {
    [_target, "activity_view", LSTRING(Activity_cpr), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

    if (local _target) then {
        [QGVAR(treatmentAdvanced_CPRLocal), [_caller, _target]] call CBA_fnc_localEvent;
    } else {
        [QGVAR(treatmentAdvanced_CPRLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;
    };
};
true;
