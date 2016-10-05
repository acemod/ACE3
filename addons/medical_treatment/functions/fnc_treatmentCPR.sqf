/*
 * Author: Glowbal
 * Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (alive _target && {(_target getVariable [QEGVAR(medical,inCardiacArrest), false] || _target getVariable [QEGVAR(medical,inReviveState), false])}) then {
    [_target, "activity_view", ELSTRING(medical,Activity_cpr), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

    [QGVAR(treatmentCPRLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;
};

true
