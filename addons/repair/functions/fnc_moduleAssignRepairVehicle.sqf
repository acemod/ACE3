/*
 * Author: Glowbal
 * Assign a repair vehicle.
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
 * [logic] call ace_repair_fnc_moduleAssignRepairVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if (!isNull _logic) then {
    private _list = _logic getVariable ["EnableList", ""];
    private _setting = _logic getVariable ["role", 0];

    [_list, "ACE_isRepairVehicle", _setting, true] call EFUNC(common,assignObjectsInList);
    [synchronizedObjects _logic, "ACE_isRepairVehicle", _setting, true] call EFUNC(common,assignObjectsInList);
};
