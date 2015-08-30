/*
 * Author: commy2
 *
 * Returns all hitpoints and their selections of any vehicle. Might contain duplicates if the turrets contain non unique hitpoints with different selection names.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The hitpoints with selections. Format: [hitpoints, selections]. They correspond by index. (Array)
 */
#include "script_component.hpp"

params ["_vehicle"];

private "_hitPointsWithSelections";
_hitPointsWithSelections = getAllHitPointsDamage _vehicle;
_hitPointsWithSelections resize 2;
_hitPointsWithSelections
