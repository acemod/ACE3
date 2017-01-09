/*
 * Author: KoffeinFlummi, commy2, Ruthberg
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

params ["_unit", "_damage"];

TRACE_2("explosion near player",_unit,_damage);

private ["_strength"];
_strength = (0 max _damage) * 30;
if (_strength < 0.01) exitWith {};

// Call inmediately, as it will get pick up later anyway by the update thread
[_strength] call FUNC(earRinging);
