#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if caller can access targets medical equipment, based upon accessLevel.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [bob, target] call ACE_medical_treatment_fnc_canAccessMedicalEquipment
 *
 * Public: Yes
 */

params ["_caller", "_target"];

private _accessLevel = _target getVariable [QGVAR(allowSharedEquipmentAccess), -1];

switch (_accessLevel) do {
    case 0: { true };
    case 1: { side _target == side _caller };
    case 2: { group _target == group _caller };
    default { false };
};
