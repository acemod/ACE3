/*
 * Author: Zakant
 * Handels the failure of the CPR treatment.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_caller", "_target"];

if(!(_target call EFUNC(common,isAwake)) || {_target getVariable [QEGVAR(medical,inCardiacArrest), false]) then {
    _target setVariable [QEGVAR(medical,heartRate), 0, true];
};
_target setVariable [QGVAR(receiveCPR), false, true];
[_target] call FUNC(calculateBlood);
