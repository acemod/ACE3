#include "script_component.hpp"
/*
 * Author: ?
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 * 2: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, backpackContainer bob, "ACE_Banana"] call ace_reload_fnc_onTake
 *
 * Public: No
 */

params ["_unit", "_container", "_item"];
if (
    _unit == ACE_player
    && {GVAR(DisplayText)}
    && {_item == currentMagazine _unit}
    && {_container in [uniformContainer _unit, vestContainer _unit, backpackContainer _unit]}
) then {
    _unit call FUNC(displayAmmo);
};
