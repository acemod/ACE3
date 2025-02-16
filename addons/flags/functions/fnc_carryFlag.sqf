#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Attaches flag to the back of the unit and removes his flag item.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flag item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "ace_flags_white"] call ace_flags_fnc_carryFlag
 *
 * Public: No
 */

params ["_unit", "_item"];
TRACE_2("Carry flag",_unit,_item);

(GVAR(flagItemCache) get _item) params ["", "_texture", "", "", "", "_mass"];
_unit forceFlagTexture _texture;

_unit setVariable [QGVAR(carryingFlag), _item, true];
_unit removeItem _item;

if ("ace_movement" call EFUNC(common,isModLoaded)) then {
    [_unit, _unit, _mass] call EFUNC(movement,addLoadToUnitContainer);
};
