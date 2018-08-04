#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if unit has a tourniquet applied to the specified bodypart
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Has tourniquet applied <BOOL>
 *
 * Example:
 * [player, "leftleg"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo
 *
 * Public: No
 */

params ["_target", "_bodyPart"];

private _index = ALL_BODY_PARTS find toLower _bodyPart;

_index >= 0 && {HAS_TOURNIQUET_APPLIED_ON(_target,_index)}
