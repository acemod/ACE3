/*
 * Author: BaerMitUmlaut
 * Sends a request to the units assigned medic to heal it.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_medical_ai_fnc_requestMedic
 *
 * Public: No
 */
#include "script_component.hpp"

private _assignedMedic = _this getVariable QGVAR(assignedMedic);
private _healQueue = _assignedMedic getVariable [QGVAR(healQueue), []];
_healQueue pushBack _this;
_assignedMedic setVariable [QGVAR(healQueue), _healQueue];

#ifdef DEBUG_MODE_FULL
    systemChat format ["%1 requested %2 for medical treatment", _this, _assignedMedic];
#endif
