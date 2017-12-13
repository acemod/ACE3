/*
 * Author: chris579
 * Checks if camouflage can be removed of a trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * Can remove <BOOL>
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_canRemoveCamouflage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_trench"];

(count (_trench getVariable [QGVAR(camouflageObjects), []]) > 0)
