/*
 * Author: KoffeinFlummi
 * Callback when the epipen treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

[_target, false] call EFUNC(medical,setUnconscious);
