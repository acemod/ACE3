/*
 * Author: Glowbal
 * Assign vehicle as a medical vehicle.
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
 * [LOGIC, [bob, kevin], true] call ACE_medical_fnc_moduleAssignMedicalVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if (!isNull _logic) then {
    private _list = _logic getVariable ["EnableList", ""];
    private _setting = _logic getVariable ["enabled", 0];

    [_list, QGVAR(medicClass), _setting, true] call EFUNC(common,assignObjectsInList);
    [synchronizedObjects _logic, QGVAR(medicClass), _setting, true, true] call EFUNC(common,assignObjectsInList);
};
