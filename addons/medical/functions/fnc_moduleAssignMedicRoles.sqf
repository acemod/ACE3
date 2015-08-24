/*
 * Author: Glowbal
 * Assign a medical role to a unit.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if (!isNull _logic) then {
    private ["_list", "_setting"];
    _list = _logic getVariable ["EnableList", ""];
    _setting = _logic getVariable ["role", 0];

    [_list, QGVAR(medicClass), _setting, true] call EFUNC(common,assignObjectsInList);
    [synchronizedObjects _logic, QGVAR(medicClass), _setting, true] call EFUNC(common,assignObjectsInList);
};
