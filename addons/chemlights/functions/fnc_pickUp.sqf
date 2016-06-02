/*
 * Author: voiper
 * Pick up chemlight.
 *
 * Arguments:
 * 1: Player <OBJECT>
 * 2: Chemlight <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _vehicle] call ace_chemlights_fnc_pickUp;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_chemlight"];
private ["_objects", "_dummy"];

_objects = attachedObjects _chemlight;

if (count _objects > 0) then {
    _dummy = _objects select 0;
}:

[_projectile, _dummy] call FUNC(expireChemlight);
[_unit, _dummy] call EFUNC(common,addToInventory);