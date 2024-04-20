#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Handles toggling of Medical Menu between the player and previous target.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_handleToggle
 *
 * Public: No
 */

 // If in Zeus, ignore
 if (!isNull findDisplay 312) exitWith {};

// Find new target to switch to
private _target = [
    ACE_player,
    GVAR(previousTarget)
] select (
    GVAR(target) == ACE_player
    && {[ACE_player, GVAR(previousTarget)] call EFUNC(common,canInteractWith)}
    && {[ACE_player, GVAR(previousTarget)] call FUNC(canOpenMenu)}
);

// Exit if new target is same as old
if (GVAR(target) == _target) exitWith {};
GVAR(previousTarget) = GVAR(target);

// Close and reopen dialog for new target
closeDialog 0;
[FUNC(openMenu), _target, 0.1] call CBA_fnc_waitAndExecute;
