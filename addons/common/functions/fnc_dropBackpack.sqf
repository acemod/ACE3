/*
 * Author: commy2
 * Drops a backback. Also returns the ground wepaon holder object of the dropped backpack.
 *
 * Arguments:
 * 0: Unit that has a backpack <OBJECT>
 *
 * Return Value:
 * Ground wepaon holder with backpack <OBJECT>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private ["_backpackObject", "_holder"];

_backpackObject = backpackContainer _unit;
_unit addBackpack "Bag_Base";
removeBackpack _unit;
_holder = objNull;

{
    if (_backpackObject in everyBackpack _x) exitWith {
        _holder = _x;
    };
} count (position _unit nearObjects ["WeaponHolder", 5]);

_holder
