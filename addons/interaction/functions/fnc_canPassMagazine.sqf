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
private ["_compatibleMags", "_filteredMags"];

_compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
_filteredMags = [magazinesAmmoFull _player, {
    params ["_className", "", "_loaded"];
    _className in _compatibleMags && !_loaded
}] call EFUNC(common,filter);

if (!(_filteredMags isEqualTo []) && {{_target canAdd (_x select 0)} count _filteredMags > 0}) then {
    true
} else {
    false
};