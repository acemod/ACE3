/*
 * Author: bux578
 * Switches to a unit close to a clicked map position
 *
 * Arguments:
 * 0: Faction <ARRAY>
 *   0: unit <OBJECT>
 *   1: sides <ARRAY>
 * 1: Map Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit, _sides], [20, 30]] call ace_switchunits_fnc_handleMapClick
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_faction", "_pos"];
_faction params ["", "_sides"];

private _sideNearest = [];

{
    if ([_x] call FUNC(isValidAi) && (side group _x in _sides)) then {
        _sideNearest pushBack _x;
    };
    nil
} count (nearestObjects [_pos, ["Man"], 15]);

if (count _sideNearest > 0) then {
    [_sideNearest select 0] call FUNC(switchUnit);
    openMap false;
};
