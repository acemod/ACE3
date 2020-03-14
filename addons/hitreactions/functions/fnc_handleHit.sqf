#include "script_component.hpp"
/*
 * Author: commy2
 * Adds reactions to a unit that was hit. EH only runs where to unit is local. Adds screams, falling down, falling from ladders, ejecting from static weapons and camshake for players
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: firer <OBJECT>
 * 2: damage taken <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, kevin, 5] call ACE_hitreactions_fnc_fallDown
 *
 * Public: No
 */

params ["_unit", "_firer", "_damage"];

// Ignore collision damage.
if (_unit == _firer) exitWith {};

// Camshake for player.
if (_unit == ACE_player) then {
    if (visibleMap) then {
        openMap false;
    };
    addCamShake [3, 5, _damage + random 10];
};

// Fall if enabled.
if (GVAR(minDamageToTrigger) != -1 && {_damage >= GVAR(minDamageToTrigger)}) then {
    _unit call FUNC(fallDown);
};

// Throw weapon if enabled.
if (GVAR(minDamageToTriggerThrow) != -1 && {_damage >= GVAR(minDamageToTriggerThrow)}) then {
    _unit call FUNC(throwWeapon);
};
