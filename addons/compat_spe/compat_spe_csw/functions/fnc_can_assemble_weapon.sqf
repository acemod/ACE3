#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Determines whether the player can assemble the static weapon.
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * If the player can assemble the static weapon <BOOL>
 *
 * Example:
 * [cursorObject, currentWeapon player] call SPE_Weapons_Static_fnc_can_assemble_weapon
 *
 * Public: No
 */

params ["_tripod", "_weaponComponent"];

private _unit = call SPE_fnc_findPlayer;

alive _unit &&
{alive _tripod} &&
{isNull objectParent _unit} &&
{_weaponComponent in (weapons _unit)} &&
{CONDITION_NO_CSW(_tripod)} // CSW check
