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

if ("ace_movement" call EFUNC(common,isModLoaded)) then {
    private _mass = (GVAR(flagItemCache) get _item) select 5;
    [_unit, _unit, -_mass] call EFUNC(movement,addLoadToUnitContainer);
};
