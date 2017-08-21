/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to switch to next or previous camera focus
 *
 * Arguments:
 * 0: Next/Prev unit <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_spectator_fnc_switchFocus
 *
 * Public: No
 */

#include "script_component.hpp"

private _next = param [0, true];
private _entities = [true] call FUNC(getTargetEntities);
private _focus = GVAR(camTarget);

// No entities to switch to
if ((_entities isEqualTo []) || (_entities isEqualTo [_focus])) exitWith {};

private _index = (_entities find _focus) max 0;

_index = (_index + ([-1, 1] select _next)) % (count _entities);
if (_index < 0) then { _index = count _entities + _index; };

[_entities select _index] call FUNC(setFocus);
