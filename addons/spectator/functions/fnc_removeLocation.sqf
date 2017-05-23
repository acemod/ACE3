/*
 * Author: Nelson Duarte, SilentSpike
 * Remove a location that can be seen in spectator view. Local effect.
 *
 * Arguments:
 * 0: Unique ID <STRING>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_id] call ace_spectator_fnc_removeLocation
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_id","",[""]]];

private _index = -1;

{
    if ((_x select 0) == _id) exitWith {
        _index = _forEachIndex;
    };
} forEach GVAR(locationsList);

GVAR(locationsList) deleteAt _index;

// Return
_index != -1
