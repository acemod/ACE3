/*
 * Author: Glowbal
 * Assign an engineer role to a unit
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
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
    _list = _logic getvariable ["EnableList",""];
    _setting = _logic getvariable ["role",0];

    [_list, "ACE_IsEngineer", _setting, true] call EFUNC(common,assignObjectsInList);
    [synchronizedObjects _logic, "ACE_IsEngineer", _setting, true] call EFUNC(common,assignObjectsInList);
 };

true
