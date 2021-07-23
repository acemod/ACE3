#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handle respawn events and clears list of jammed weapons.
 * DefaultAction that blocks firing is removed by the game (remains on corpse?),
 * but variables need to be cleared manually.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [alive, body] call ace_overheating_fnc_handleRespawn
 *
 * Public: No
 */

params ["_unit","_dead"];
if !(local _unit) exitWith {};

// --- Reset variables related to jamming
_unit setVariable [QGVAR(jammedWeapons), nil];
_unit setVariable [QGVAR(JammingActionID), nil];
