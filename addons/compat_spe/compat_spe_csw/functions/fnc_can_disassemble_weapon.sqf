#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Checks if the static weapon can be disassembled.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * If the player can disassemble the static weapon <BOOL>
 *
 * Example:
 * cursorObject call SPE_Weapons_Static_fnc_can_disassemble_weapon
 *
 * Public: No
 */

params ["_weaponPlatform"];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _weaponPlatform} &&
{isNull objectParent _unit} &&
{crew _weaponPlatform isEqualTo []} &&
{weaponDisassemblyEnabled _unit} &&
{weaponDisassemblyEnabled _weaponPlatform} &&
{!(_weaponPlatform lockedTurret [0])} &&
{CONDITION_NO_CSW(_weaponPlatform)} // CSW check
