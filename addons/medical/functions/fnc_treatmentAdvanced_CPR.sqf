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
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (alive _target && {(_target getVariable [QGVAR(inCardiacArrest), false] || _target getVariable [QGVAR(inReviveState), false])}) then {
    [[_caller, _target], QUOTE(DFUNC(treatmentAdvanced_CPRLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};
true;
