#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Checks if the static weapon's height can be adjusted.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Check for ACE CSW <BOOL> (default: false)
 *
 * Return Value:
 * If the player can alter the static weapon's height <BOOL>
 *
 * Example:
 * cursorObject call SPE_Weapons_Static_fnc_can_alter_height
 *
 * Public: No
 */

params ["_weaponPlatform", ["_checkForCSW", false, [false]]];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{isNull objectParent _unit} &&
{crew _weaponPlatform isEqualTo []} &&
{!(_weaponPlatform lockedTurret [0])} && {
    // CSW check
    (!_checkForCSW && {CONDITION_NO_CSW(_weaponPlatform)}) ||
    {_checkForCSW && {!(CONDITION_NO_CSW(_weaponPlatform))}}
}
