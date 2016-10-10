/*
 * Author: commy2
 * Adds pain to unit and plays a scream sound.
 *
 * Arguments:
 * 0: Argument Name <TYPE>
 * 0: Argument Name <TYPE>
 *
 * Return Value:
 * Return Name <TYPE>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */
#include "script_component.hpp"

params ["_unit", "_painToAdd"];

_painToAdd = _painToAdd min 1;

private _pain = _unit getVariable [QEGVAR(medical,pain), 0];
_pain = _pain + _painToAdd * (1 - _pain);

_unit setVariable [QEGVAR(medical,pain), _pain];

[_unit, "hit", PAIN_TO_SCREAM(_painToAdd)] call EFUNC(medical_engine,playInjuredSound);
