#include "script_component.hpp"
/*
 * Author: kymckay
 * Returns a hashmap of the stitchable wounds that the given unit has on each body part.
 * A stitchable wound is a bandaged wound on a body part that does not have any bleeding wounds.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Stitchable Wounds <HASHMAP>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_getStitchableWounds
 *
 * Public: No
 */

params ["_unit"];

// First determine which body parts have a bleeding wound
private _bleedingBodyParts = createHashMap;
{
    private _isBleeding = _y findIf {
        _x params ["", "_amountOf", "_bleedingRate"];
        _amountOf > 0 && {_bleedingRate > 0}
    } != -1;

    if (_isBleeding) then {
        _bleedingBodyParts set [_x, true];
    };
} forEach GET_OPEN_WOUNDS(_unit);

// Any bandaged wound on a body part not bleeding is stitchable
private _stitchableWounds = createHashMap;
{
    if (!(_x in _bleedingBodyParts) && {_y isNotEqualTo []}) then {
        _stitchableWounds set [_x, _y];
    };
} forEach GET_BANDAGED_WOUNDS(_unit);

_stitchableWounds
