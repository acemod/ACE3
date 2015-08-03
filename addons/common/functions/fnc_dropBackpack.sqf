/*
 * Author: commy2
 *
 * Drops a backback. Also returns the ground wepaon holder object of the dropped backpack.
 *
 * Argument:
 * 0: Unit that has a backpack (Object)
 *
 * Return value:
 * Ground wepaon holder with backpack (Object)
 *
 */
#include "script_component.hpp"

params ["_unit"];

private ["_backpackObject","_holder"];

_backpackObject = backpackContainer _unit;
_unit addBackpack "Bag_Base";
removeBackpack _unit;
_holder = objNull;

{
    if (_backpackObject in everyBackpack _x) exitWith {
        _holder = _x;
    };
} forEach (position _unit nearObjects ["WeaponHolder", 5]);

_holder
