/*
 * Author: commy2
 * Adds pain to unit and plays a scream sound.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Pain to add <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, 0.5] call ace_medical_fnc_addPain
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_painToAdd"];

_painToAdd = _painToAdd min 1;

private _pain = _unit getVariable [QEGVAR(medical,pain), 0];
_pain = _pain + _painToAdd * (1 - _pain);

_unit setVariable [QEGVAR(medical,pain), _pain];

[_unit, "hit", PAIN_TO_SCREAM(_painToAdd)] call EFUNC(medical_engine,playInjuredSound);
