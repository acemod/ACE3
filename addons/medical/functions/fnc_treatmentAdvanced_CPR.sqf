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
    [_target, "activity_view", LSTRING(Activity_cpr), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

    if (local _target) then {
        ["treatmentAdvanced_CPRLocal", [_caller, _target]] call EFUNC(common,localEvent);
    } else {
        ["treatmentAdvanced_CPRLocal", _target, [_caller, _target]] call EFUNC(common,targetEvent);
    };
};
true;
