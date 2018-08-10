#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles a unit entering cardiac arrest.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

// 10% possible variance in cardiac arrest time
private _time = GVAR(cardiacArrestTime);
_time = _time + random [_time*-0.1, 0, _time*0.1];

_unit setVariable [QGVAR(cardiacArrestTime), _time];
_unit setVariable [QGVAR(cardiacArrestStart), CBA_missionTime];

[_unit] call EFUNC(medical_status,setCardiacArrest);
