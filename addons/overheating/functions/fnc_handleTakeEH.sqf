/*
 * Author: Commy2
 * Handle "take" event
 * I think it fixs jams when manually dragging a new magazine in from player's inventory
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: container <OBJECT>
 * 2: item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, thing, "thing"] call ace_overheating_fnc_handleTakeEH
 *
 * Public: No
 */
#include "script_component.hpp"

if !(GVAR(unJamOnreload)) exitWith {};

params ["_unit", "_container", "_item"];
TRACE_3("params",_unit,_container,_item);

if ((_unit == ACE_player)
        && {_container in [uniformContainer _unit, vestContainer _unit, backpackContainer _unit]}
        && {_item == currentMagazine _unit}) then { //Todo: should this be any valid magazine for any jammed gun?

    TRACE_1("clearing jam",currentWeapon _unit);
    [_unit, currentWeapon _unit, true] call FUNC(clearJam)

};
