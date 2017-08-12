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

// Update the list if appropriate
if !(isNull SPEC_DISPLAY) then {
    if (GVAR(uiListType) == LIST_LOCATIONS) then {
        [] call FUNC(ui_updateListLocations);
    };
};

// Return
_index != -1
