/*
 * Author: Glowbal
 * Validate the vehicle cargo space.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_validateCargoSpace
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

private _newLoaded = [];
private _totalSpaceOccupied = 0;
{
    if ((_x isEqualType "") || {!isNull _x}) then {
        _newLoaded pushback _x;
        _totalSpaceOccupied = _totalSpaceOccupied + ([_x] call FUNC(getSizeItem));
    };
    true
} count _loaded;

if (count _loaded != count _newLoaded) then {
    _vehicle setVariable [QGVAR(loaded), _newLoaded, true];
};

_vehicle setVariable [QGVAR(space), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(space)) - _totalSpaceOccupied, true];
