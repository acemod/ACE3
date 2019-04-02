#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the default state
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_handleStateDefault
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    _unit setVariable [VAR_HEART_RATE, GET_HEART_RATE(_unit), true];
    _unit setVariable [VAR_BLOOD_PRESS, _unit getVariable [VAR_BLOOD_PRESS, [80, 120]], true];
    _unit setVariable [VAR_BLOOD_VOL, GET_BLOOD_VOLUME(_unit), true];
};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

private _painLevel = GET_PAIN_PERCEIVED(_unit);
if (_painLevel > 0) then {
    [QEGVAR(medical,moan), [_unit, _painLevel]] call CBA_fnc_localEvent;
};
