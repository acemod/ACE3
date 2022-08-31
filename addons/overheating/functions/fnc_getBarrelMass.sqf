#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror, drofseh
 * Get the mass of the weapons barrel.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * Barrel Mass <NUMBER>
 *
 * Example:
 * [currentWeapon ACE_player] call ace_overheating_fnc_getBarrelMass
 *
 * Public: No
 */

params ["_weapon"];

private _barrelMass = ([_weapon] call FUNC(getWeaponData)) select 7;

_barrelMass
