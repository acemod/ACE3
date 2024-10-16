#include "script_component.hpp"
/*
 * Author: Timi007
 * Stops carrying flag and adds flag item back to unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_flags_fnc_furlFlag
 *
 * Public: No
 */

params ["_unit"];

// Stop carrying flag and add flag item to unit.
_item = _unit getVariable [QGVAR(carryingFlag), ""];
_unit setVariable [QGVAR(carryingFlag), nil, true];

_unit forceFlagTexture ""; // Remove flag

[_unit, _item] call EFUNC(common,addToInventory);
