#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the unit was requested to treat another unit.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Was requested <BOOL>
 *
 * Example:
 * call ACE_medical_ai_fnc_wasRequested
 *
 * Public: No
 */

private _healQueue = _this getVariable [QGVAR(healQueue), []];
!(_healQueue isEqualTo [])
