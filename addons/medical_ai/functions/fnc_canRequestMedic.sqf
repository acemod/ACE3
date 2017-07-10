/*
 * Author: BaerMitUmlaut
 * Checks if there is a medic available in the unit's group.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can request medic <BOOL>
 *
 * Example:
 * call ACE_medical_ai_fnc_canRequestMedic
 *
 * Public: No
 */
#include "script_component.hpp"

// Note: Although an unconscious unit cannot call for a medic itself,
//   we ignore this here. We need to "notice" the medic that he should
//   treat other units, or else he won't do anything on his own.

if ([_this] call EFUNC(medical,isMedic) || {vehicle _this != _this}) exitWith {false};

{
    if ([_x] call EFUNC(medical,isMedic) && {!([_x] call EFUNC(common,isPlayer))}) exitWith {
        _this setVariable [QGVAR(assignedMedic), _x];
        true
    };
    false
} forEach (units _this);
