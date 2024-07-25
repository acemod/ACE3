#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, Ruthberg
 * Handles deafness due to explosions going off near the player.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Damage inflicted to the unit <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientExplosionEvent] call ace_hearing_fnc_explosionNear
 *
 * Public: No
 */

params ["_unit", "_damage"];

TRACE_2("explosion near player",_unit,_damage);

private _strength = (0 max _damage) * 30;

// Call immediately, as it will get picked up later by the update thread anyway
_strength call FUNC(earRinging);
