/*
 * Author: Glowbal
 * Validate the vehicle cargo space.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_validateCargoSpace
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_loaded", "_newLoaded", "_totalSpaceOccupied"];

params ["_vehicle"];

_loaded = _vehicle getVariable [QGVAR(loaded), []];

_newLoaded = [];
_totalSpaceOccupied = 0;
{
    if !(isNull _x) then {
        _newLoaded pushBack _x;
        _totalSpaceOccupied = _totalSpaceOccupied + ([_x] call FUNC(getSizeItem));
    };
    true
} count _loaded;

if (count _loaded != count _newLoaded) then {
    _vehicle setVariable [QGVAR(loaded), _newLoaded, true];
};

_vehicle setVariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(space)) - _totalSpaceOccupied, true];
