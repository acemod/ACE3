#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Checks if unit is reloading
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_common_fnc_isReloading
 *
 * Public: No
 */

 params ["_unit"];

 ((weaponState _unit) select 6) != 0
