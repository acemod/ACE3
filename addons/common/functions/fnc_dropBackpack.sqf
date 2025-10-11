#include "..\script_component.hpp"
/*
 * Author: commy2
 * Drops a backback. Also returns the ground weapon holder object of the dropped backpack.
 *
 * Arguments:
 * 0: Unit that has a backpack <OBJECT>
 *
 * Return Value:
 * Ground weapon holder with backpack <OBJECT>
 *
 * Example:
 * [unit] call ace_common_fnc_dropBackpack
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

private _backpackObject = backpackContainer _unit;

_unit addBackpack "ACE_FakeBackpack";
removeBackpack _unit;

objectParent _backpackObject // return
