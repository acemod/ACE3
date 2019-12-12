#include "script_component.hpp"
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
 * player call ACE_medical_ai_fnc_canRequestMedic
 *
 * Public: No
 */

// Note: Although an unconscious unit cannot call for a medic itself,
//   we ignore this here. We need to "notice" the medic that he should
//   treat other units, or else he won't do anything on his own.

if ([_this] call EFUNC(medical_treatment,isMedic) || {vehicle _this != _this}) exitWith {false};

// Search for a medic, prioritize unitReady
private _medic = objNull;
{
    if ([_x] call EFUNC(medical_treatment,isMedic) && {!([_x] call EFUNC(common,isPlayer))} && {
        _medic = _x;
        (unitReady _medic)
    }) exitWith {};
} forEach (units _this);

_this setVariable [QGVAR(assignedMedic), _medic];
!isNull _medic
