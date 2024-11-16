#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit (litres/second) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_fnc_getBloodLoss
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {-1};

_unit call EFUNC(medical_status,getBloodLoss)
