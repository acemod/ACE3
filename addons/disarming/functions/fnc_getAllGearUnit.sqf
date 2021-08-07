#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 * Helper function to get all gear of a unit.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Array of 2 arrays, classnames and count<ARRAY>
 *
 * Example:
 * [["ace_bandage"],[2]] = [bob] call ace_disarming_fnc_getAllGearUnit
 *
 * Public: No
 */

params ["_target"];

toArray uniqueUnitItems [_target, 1, 2, 2, 2, true]
