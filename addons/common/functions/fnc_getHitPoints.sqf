/*
 * Author: commy2
 * Returns all hitpoints and their selections of any vehicle. Might contain duplicates if the turrets contain non unique hitpoints with different selection names.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Hitpoints <ARRAY>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_getHitPoints","3.5.0","getAllHitPointsDamage");

params ["_vehicle"];

private "_hitPointsWithSelections";
_hitPointsWithSelections = getAllHitPointsDamage _vehicle;

// get correct format on vehicles without any hitpoints
if (_hitPointsWithSelections isEqualTo []) then {
    _hitPointsWithSelections = [[],[],[]];
};

(_hitPointsWithSelections select 0) - [""]
