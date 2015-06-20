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

private ["_caller", "_target", "_selectionName", "_className", "_items"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (_target getvariable [QGVAR(inCardiacArrest), false] || _target getvariable [QGVAR(inReviveState), false]) then {
    [[_caller, _target], QUOTE(DFUNC(treatmentAdvanced_CPRLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};
true;
