#include "..\script_component.hpp"
/*
 * Author: Grim
 * Handles a unit reaching the point of unconsciousness (calls for a status update).
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateUnconscious
 *
 * Public: No
 */
params ["_unit"];

if (isNull _unit || {!isNil {_unit getVariable QEGVAR(medical,causeOfDeath)}}) exitWith {
    WARNING_1("enteredStateUnconscious: State transition on dead or null unit - %1",_unit);
};

//IGNORE_PRIVATE_WARNING ["_thisOrigin", "_thisTransition"]; // vars provided by CBA_statemachine
TRACE_4("enteredStateUnconscious",_this,_thisOrigin,_thisTransition,CBA_missionTime);

[_unit, true] call EFUNC(medical_status,setUnconsciousState);
