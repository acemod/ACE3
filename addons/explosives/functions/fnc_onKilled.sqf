/*
 * Author: Garth 'L-H' de Wet
 * Detonates all attached deadman's switched triggered explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * Handled by CBA
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_deadman"];
_unit = _this select 0;
if (_unit == ACE_player) then {
    call FUNC(place_Cancel);
};
if (!isServer) exitWith{};
_deadman = [_unit, "DeadManSwitch"] call FUNC(getPlacedExplosives);
{
    [_unit, -1, _x, true] call FUNC(detonateExplosive);
} foreach _deadman;
