#include "script_component.hpp"
/*
 * Author: RedBery
 * Handles a unit leaving cardiac arrest (calls for a status update).
 * Clears countdown timer variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_leftStateCardiacArrest
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("leftStateCardiacArrest",_unit);

_unit setVariable [QGVAR(cardiacArrestTimeLeft), nil];
_unit setVariable [QGVAR(cardiacArrestTimeLastUpdate), nil];

[_unit, false] call EFUNC(medical_status,setCardiacArrestState);
