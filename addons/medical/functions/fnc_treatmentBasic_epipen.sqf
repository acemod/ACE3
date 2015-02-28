/*
 * Author: KoffeinFlummi
 * Epipen treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment Classname <STRING>
 * 4: Items required <ARRAY<STRING>>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

_medic = _this select 0;
_patient = _this select 1;
_items = _this select 4;

[_patient, false] call FUNC(setUnconscious);
