#include "script_component.hpp"
/*
 * Author: Glowbal
 * Sets the traige status of the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Status <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 2] call ace_medical_treatment_fnc_setTriageStatus
 *
 * Public: No
 */

params ["_unit", "_status"];

_unit setVariable [QEGVAR(medical,triageLevel), _status, true];
