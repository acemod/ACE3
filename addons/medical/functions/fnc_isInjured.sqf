#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit needs treatment.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Does unit need treatment <BOOL>
 *
 * Example:
 * player call ace_medical_fnc_isInjured
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if !(alive _unit) exitWith {false};

_unit call EFUNC(medical_ai,isInjured)
