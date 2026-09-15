#include "..\script_component.hpp"
/*
 * Author: ? (SPE), edited by johnb43 to be made CSW compatible
 * Checks if the player can prepare the static weapon's ammo.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Magazine to load <STRING>
 * 2: If the magazine has been selected to be prepped for loading <BOOL> (default: false)
 *
 * Return Value:
 * If the player can prepare the static weapon's ammo <BOOL>
 *
 * Example:
 * [cursorObject, currentMagazine player] call SPE_Weapons_Static_fnc_can_prepare_ammo
 *
 * Public: No
 */

params ["_weaponPlatform", "_ammo", ["_isSelected", false]];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{vehicle _unit in [_unit, _weaponPlatform]} &&
{
    private _defaultMags = getArray (configOf _weaponPlatform >> "Turrets" >> "MainTurret" >> "magazines");

    if (({_x in _defaultMags} count (magazines _weaponPlatform)) > 1) exitWith {
        false
    };

    private _selectedMagazine = _unit getVariable ["SPE_Static_Weapon_Magazine", ""];

    _isSelected == (_selectedMagazine == _ammo)
} &&
{CONDITION_NO_CSW(_weaponPlatform)} // CSW check
