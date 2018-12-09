#include "script_component.hpp"
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

params ["_faction", "_pos"];
_faction params ["", "_sides"];

private _nearestObjects = nearestObjects [_pos, ["Man"], 15];

private _nearestValidUnitIndex = _nearestObjects findIf {(side group _x in _sides) && {[_x] call FUNC(isValidAi)}};

if (_nearestValidUnitIndex != -1) then {
    [_nearestObjects select _nearestValidUnitIndex] call FUNC(switchUnit);
    openMap false;
};
