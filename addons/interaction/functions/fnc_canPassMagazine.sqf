/*
 * Author: BaerMitUmlaut
 * Checks if unit has a spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that passes the magazine <OBJECT>
 * 1: Unit to pass the magazine to <OBJECT>
 * 2: Weapon classname <STRING>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "arifle_MX_F"] call ace_interaction_fnc_canPassMagazine
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_player", "_target", "_weapon"];
private ["_compatibleMags", "_filterFunc", "_filteredMags"];

_compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
_filterFunc = compile format ["((_this select 0) in %1) && (!(_this select 2))", _compatibleMags];
_filteredMags = [magazinesAmmoFull _player, _filterFunc] call EFUNC(common,filter);

if (count _filteredMags > 0) then {
    ({(_target canAddItemToUniform (_x select 0)) || (_target canAddItemToVest (_x select 0)) || (_target canAddItemToBackpack (_x select 0))} count _filteredMags) > 0
} else {
    false
};