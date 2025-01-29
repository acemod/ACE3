#include "..\script_component.hpp"
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

private _item = _unit getVariable [QGVAR(carryingFlag), ""];

_unit setVariable [QGVAR(carryingFlag), nil, true];
_unit forceFlagTexture ""; // Remove flag

[_unit, _item] call EFUNC(common,addToInventory);

(GVAR(flagItemCache) get _item) param ["", "", "", "", "", "_mass"];
[_unit, _unit, -_mass] call EFUNC(movement,addLoadToUnitContainer);
