#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the unconscious state
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_handleStateCardiacArrest
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};
if (!local _unit) exitWith {};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);
