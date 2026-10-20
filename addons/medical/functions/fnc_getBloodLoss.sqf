#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit (litres/second) <NUMBER>
 *
 * Example:
 * player call ace_medical_fnc_getBloodLoss
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith {
    ERROR_1("unit [%1] is not local",_unit);
    -1
};

GET_BLOOD_LOSS(_unit)
