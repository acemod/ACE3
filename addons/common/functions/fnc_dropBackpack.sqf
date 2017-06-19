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
 * Example:
 * [unit] call ace_common_fnc_dropBackpack
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _backpackObject = backpackContainer _unit;

_unit addBackpack "ACE_FakeBackpack";
removeBackpack _unit;

objectParent _backpackObject // return
