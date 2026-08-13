#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Checks if resupply of ammo to a static weapon is available.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Default magazine to load (unused)
 *
 * Return Value:
 * If the player can load the static weapon's ammo <BOOL>
 *
 * Example:
 * cursorObject call SPE_Weapons_Static_fnc_can_resupply_ammo
 *
 * Public: No
 */

params ["_weaponPlatform"];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{vehicle _unit in [_unit, _weaponPlatform]} &&
{(_weaponPlatform magazinesTurret [[0], false]) isEqualTo []} && // Limit the reload capacity of a static weapon to 1 magazines
{CONDITION_NO_CSW(_weaponPlatform)} // CSW check
