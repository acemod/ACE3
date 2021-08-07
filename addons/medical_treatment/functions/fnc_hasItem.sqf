#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Checks if one of the given items are present between the medic and patient.
 * Does not respect the priority defined by the allowSharedEquipment setting.
 * Will check medic first and then patient if shared equipment is allowed.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY>
 *
 * Return Value:
 * Has Item <BOOL>
 *
 * Example:
 * [player, cursorObject, ["ACE_fieldDressing"]] call ace_medical_treatment_fnc_hasItem
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];


private _return = false;
{
    if ([_medic, _x] call EFUNC(common,hasItem) || {GVAR(allowSharedEquipment) != 2 && {[_patient, _x] call EFUNC(common,hasItem)}}) exitWith {
        _return = true;
    };
} forEach _items;

_return
