/*
 * Author: Zakant
 * Handels the start of the CPR treatment.
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

_target setVariable [QGVAR(receiveCPR), true, true]; // Target receives CPR
if(EGVAR(medical,CPRcreatesPulse)) then {
    _target setVariable [QEGVAR(medical,heartRate), round (30 + random [-5, 0, 5])  , true]; // And we have a (random) pulse
};

_target setVariable [QEGVAR(medical,lastTimeUpdated), CBA_missionTime, true];
