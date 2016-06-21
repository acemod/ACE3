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
 * Public: No
 */
#include "script_component.hpp"

{
    if ([_x] call EFUNC(medical,isMedic)) exitWith {
        _this setVariable [QGVAR(assignedMedic), _x];
        true
    };
    false
} forEach (units _this);
