#include "script_component.hpp"
/*
 * Author: Ir0n1E
 * Switches gunbag full/empty for mass calculation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has Gunbag <BOOL>
 *
 * Example:
 * [player] call ace_gunbag_fnc_hasGunbag
 *
 * Public: No
 */

params ["_unit"];

(backpackContainer _unit) isKindOf QUOTE(ADDON)
