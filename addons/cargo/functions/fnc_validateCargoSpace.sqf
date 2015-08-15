/*
 * Author: Glowbal
 * Validate the vehicle cargo space
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_loaded", "_newLoaded", "_totalSpaceOccupied"];
params ["_vehicle"];
_loaded = _vehicle getvariable [QGVAR(loaded), []];
_newLoaded = [];
_totalSpaceOccupied = 0;
{
    if !(isNull _x) then {
        _newLoaded pushback _x;
        _totalSpaceOccupied = _totalSpaceOccupied + ([_x] call FUNC(getSizeItem));
    };
    true
} count _loaded;

if (count _loaded != count _newLoaded) then {
    _vehicle setvariable [QGVAR(loaded), _newLoaded, true];
};
_vehicle setvariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeof _vehicle >> QGVAR(space)) - _totalSpaceOccupied, true];
