#include "..\script_component.hpp"
/*
 * Author: LinkInsGrim
 * Returns a copy of unit's stitched wounds on a body part.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Wounds <ARRAY of ARRAY>:
 *    0: Wound Class ID <NUMBER>
 *    1: Wound Stitched Amount <NUMBER>
 *    2: Wound Bleeding Coef <NUMBER>
 *    3: Wound Damage <NUMBER>
 *
 * Example:
 * [player, "head"] call ace_medical_fnc_getOpenWounds
 *
 * Public: Yes
 */

params ["_unit", "_bodyPart"];

private _stitchedWounds = [];

{
    _stitchedWounds pushBack +_x; // manual deep copy so modification doesn't affect unit state
} forEach (GET_STITCHED_WOUNDS(_patient) getOrDefault [toLowerANSI _bodyPart, []]);

_stitchedWounds
