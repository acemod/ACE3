/*
 * Author: chris579
 * Called when camouflage attribute is changed on an object
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, 1] call ace_trenches_fnc_applyCamouflageAttribute
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_value"];

if (_value isEqualTo 1) then {
    [_object] call FUNC(placeCamouflage);
} else {
    [_object] call FUNC(deleteCamouflage);
};
