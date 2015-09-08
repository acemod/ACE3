/*
 * Author: BaerMitUmlaut
 * Checks if unit has a spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that gets searched <OBJECT>
 * 1: Weapon classname <STRING>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [_player, "arifle_MX_F"] call ace_interaction_fnc_canPassMagazine
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_player", "_weapon"];
private ["_compatibleMags", "_filterFunc"];

_compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
_filterFunc = compile format ["((_this select 0) in %1) && (!(_this select 2))", _compatibleMags];

count ([magazinesAmmoFull _player, _filterFunc] call EFUNC(common,filter)) > 0