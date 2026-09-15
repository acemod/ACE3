#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), edited by johnb43 to be made CSW compatible
 * Checks if the prepped magazine for the static weapon can be loaded.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Default magazine to load (unused)
 *
 * Return Value:
 * If the player can load the selected ammo for the static weapon's <BOOL>
 *
 * Example:
 * cursorObject call SPE_Weapons_Static_fnc_can_Reload
 *
 * Public: No
 */

params ["_weaponPlatform"];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{vehicle _unit in [_unit, _weaponPlatform]} &&
{(magazines _weaponPlatform) isEqualTo []} &&
{
    private _selectedMagazine = _unit getVariable ["SPE_Static_Weapon_Magazine", ""];

    if (_selectedMagazine == "") exitWith {
        false
    };

    _selectedMagazine = _selectedMagazine call EFUNC(common,getConfigName);

    if (_selectedMagazine == "") exitWith {
        false
    };

    _selectedMagazine in compatibleMagazines ((_weaponPlatform weaponsTurret [0]) select 0)
} &&
{CONDITION_NO_CSW(_weaponPlatform)} // CSW check
