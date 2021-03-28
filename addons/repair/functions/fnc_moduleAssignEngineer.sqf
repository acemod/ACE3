#include "script_component.hpp"
/*
 * Author: Glowbal
 * Assign an engineer role to a unit.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic] call ace_repair_fnc_moduleAssignEngineer
 *
 * Public: No
 */

params ["_logic"];

if (!isNull _logic) then {
    private _list = _logic getVariable ["EnableList", ""];
    private _setting = _logic getVariable ["role", 0];

    [_list, "ACE_IsEngineer", _setting, true] call EFUNC(common,assignObjectsInList);
    [synchronizedObjects _logic, "ACE_IsEngineer", _setting, true] call EFUNC(common,assignObjectsInList);
};
