#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the unit has a tourniquet applied on the specified body part.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Has Tourniquet Been Applied <BOOL>
 *
 * Example:
 * [player, "leftleg"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo
 *
 * Public: No
 */

params ["_unit", "_bodyPart"];

private _index = ALL_BODY_PARTS find toLower _bodyPart;

_index >= 0 && {HAS_TOURNIQUET_APPLIED_ON(_unit,_index)}
