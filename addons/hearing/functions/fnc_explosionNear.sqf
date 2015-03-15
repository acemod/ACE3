/*
 * Author: KoffeinFlummi, commy2
 * Handles deafness due to explosions going off near the player.
 *
 * Arguments:
 * 0: vehicle - Object the event handler is assigned to (player) <OBJECT>
 * 1: damage - Damage inflicted to the object <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientExplosionEvent] call ace_hearing_fnc_explosionNear
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_damage", "_strength"];

_unit = _this select 0;
_damage = _this select 1;

_strength = (_damage * 2) min 1;
if (_strength < 0.01) exitWith {};

[_unit, _strength] spawn {
    sleep 0.2;
    _this call FUNC(earRinging);
};
