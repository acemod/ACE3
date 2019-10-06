#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns a list of all the stitchable wounds that the given unit has.
 * A stitchable wound is a bandaged wound on a body part that does not have any bleeding wounds.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Stitchable Wounds <ARRAY>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_getStitchableWounds
 *
 * Public: No
 */

params ["_unit"];

private _bleedingBodyParts = GET_OPEN_WOUNDS(_unit) select {
    _x params ["", "", "_amountOf", "_bleedingRate"];

    _amountOf > 0 && {_bleedingRate > 0}
} apply {
    _x select 1
};

GET_BANDAGED_WOUNDS(_unit) select {
    _x params ["", "_bodyPartN"];

    !(_bodyPartN in _bleedingBodyParts)
}
