/*
 * Author: Glowbal
 * Called when a unit is killed
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_handleKilled
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(pain), 0, true];
_unit setVariable [QGVAR(heartRate), 0, true];
_unit setVariable [QGVAR(bloodPressure), [0, 0], true];
