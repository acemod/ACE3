#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Checks if the player can unload a static weapon's magazines.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * If the player can unload the static weapon's ammo <BOOL>
 *
 * Example:
 * cursorObject call SPE_Weapons_Static_fnc_can_unload_ammo
 *
 * Public: No
 */

params ["_weaponPlatform"];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{_unit in _weaponPlatform || {isNull objectParent _unit && {(crew _weaponPlatform) isEqualTo []}}} &&
{!(_weaponPlatform lockedTurret [0])} &&
{(_weaponPlatform magazinesTurret [[0], false]) isNotEqualTo []} &&
{CONDITION_NO_CSW(_weaponPlatform)} // CSW check
