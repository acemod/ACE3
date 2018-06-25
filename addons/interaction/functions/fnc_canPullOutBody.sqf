#include "script_component.hpp"
/*
 * Author: Dystopian
 * Checks if unit can pull target body out of vehicle.
 *
 * Arguments:
 * 1: Body <OBJECT>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * Able to pull out target body <BOOL>
 *
 * Example:
 * [crew cursorObject select 0, player] call ace_interaction_fnc_canPullOutBody
 *
 * Public: No
 */

params ["_body", "_unit"];

private _vehicle = objectParent _body;

if (
    !isNull objectParent _unit
    || {alive _body}
    || {isNull _vehicle}
    || {1 < locked _vehicle}
    || {
        0 < {alive _x} count crew _vehicle // alive is in vehicle
        // group is used here for situations when side player == ENEMY
        && {0.6 > side group _unit getFriend side group _vehicle} // player is enemy
    }
) exitWith {false};

((fullCrew [_vehicle, ""] select {_body == _x select 0}) select 0) params ["", "", "_cargoIndex", "_turretPath"];

private _locked = if (!(_turretPath isEqualTo [])) then {
    _vehicle lockedTurret _turretPath;
} else {
    if (_cargoIndex > -1) then {
        _vehicle lockedCargo _cargoIndex;
    } else {
        lockedDriver _vehicle;
    };
};

!_locked
