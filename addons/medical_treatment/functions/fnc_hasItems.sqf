#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if all items are present between the patient and the medic.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * Return Value:
 * Has the items <BOOL>
 *
 * Example:
 * [bob, patient, ["bandage", "morphine"]] call ace_medical_treatment_fnc_hasItems
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];

private _return = true;

{
    // handle a one of type use item
    if (_x isEqualType [] && {{[_medic, _patient, _x] call FUNC(hasItem)} count _x == 0}) exitWith {
        _return = false;
    };

    // handle required item
    if (_x isEqualType "" && {!([_medic, _patient, _x] call FUNC(hasItem))}) exitWith {
        _return = false;
    };
} forEach _items;

_return
