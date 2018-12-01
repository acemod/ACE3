#include "script_component.hpp"
/*
 * Author:  Christian 'chris5790' Klemm
 * Apply camouflage attribute to trench.
 *
 * Arguments:
 * 0: object <OBJECT>
 * 1: value <INT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_applyCamouflageAttribute
 *
 * Public: No
 */

params ["_object", "_value"];

if (_value isEqualTo 1) then {
    [_object] call FUNC(placeCamouflage);
} else {
    [_object] call FUNC(deleteCamouflage);
};
