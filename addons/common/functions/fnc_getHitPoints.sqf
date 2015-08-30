/*
 * Author: commy2
 *
 * Returns all hitpoints of any vehicle. Might contain duplicates if the turrets contain non unique hitpoints with different selection names.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The hitpoints (Array)
 */
#include "script_component.hpp"

params ["_vehicle"];

(getAllHitPointsDamage _vehicle select 0) - [""]
