/*
 * Author: KoffeinFlummi
 * Callback when the epipen treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target","_className"];

[_target, false] call EFUNC(medical,setUnconscious);

if (_target getVariable [QEGVAR(medical,inReviveState), false]) then {
    _target setVariable [QEGVAR(medical,inReviveState), nil, true];
};
