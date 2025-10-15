#include "..\script_component.hpp"
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
if (!alive _unit || {!local _unit}) exitWith {};
if !((isPlayer _unit) || {IS_MEDICAL_ACTIVITY(_unit)}) exitWith {};

if ([_unit] call EFUNC(medical_vitals,handleUnitVitals)) then { // returns true when update ran
    private _painLevel = GET_PAIN_PERCEIVED(_unit);
    if (_painLevel > 0) then {
        [QEGVAR(medical,moan), [_unit, _painLevel]] call CBA_fnc_localEvent;
    };
};
