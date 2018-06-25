#include "script_component.hpp"
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
 * Unit can pass magazine <BOOL>
 *
 * Example:
 * [_player, _target, "arifle_MX_F"] call ace_interaction_fnc_canPassMagazine
 *
 * Public: No
 */
params ["_player", "_target", "_weapon"];

if (!GVAR(enableMagazinePassing)) exitWith {false};
if (((vehicle _target) != _target) && {(vehicle _target) != (vehicle _player)}) exitWith {false};

private _compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
{
    _x params ["_className", "", "_loaded"];
    if ((_className in _compatibleMags) && {!_loaded} && {_target canAdd _className}) exitWith {true};
    false
} foreach (magazinesAmmoFull _player);
