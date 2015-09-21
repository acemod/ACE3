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

params ["_vehicle"];

(getAllHitPointsDamage _vehicle select 0) - [""]
