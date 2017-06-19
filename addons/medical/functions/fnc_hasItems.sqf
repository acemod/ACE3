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
 * [bob, patient, ["bandage", "morphine"]] call ace_medical_fnc_hasItems
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_medic", "_patient", "_items"];

private _return = true;
{
    //
    if (_x isEqualType [] && {({[_medic, _patient, _x] call FUNC(hasItem)}count _x == 0)}) exitwith {
        _return = false;
    };
    if (_x isEqualType "" && {!([_medic, _patient, _x] call FUNC(hasItem))}) exitwith {
        _return = false;
    };
}foreach _items;

_return
