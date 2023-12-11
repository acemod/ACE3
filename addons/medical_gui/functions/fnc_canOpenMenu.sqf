#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001, johnb43
 * Checks if the player can open the Medical Menu for the target.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can open <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_gui_fnc_canOpenMenu
 *
 * Public: No
 */

params ["_player", "_target"];

// If in Zeus
if (!isNull findDisplay 312) exitWith {
    !isNull _target &&
    {missionNamespace getVariable [QGVAR(enableZeusModule), true]} &&
    {GVAR(enableMedicalMenu) > 0}
};

_player call EFUNC(common,isAwake) &&
{!isNull _target} &&
{_player distance _target < GVAR(maxDistance) || {vehicle _player == vehicle _target}} &&
{GVAR(enableMedicalMenu) == 1 || {GVAR(enableMedicalMenu) == 2 && {vehicle _player != _player || {vehicle _target != _target}}}}
