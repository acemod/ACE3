#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Creates actions for nearest vehicles with cargo.
 *
 * Arguments:
 * 0: Holder object (vehicle) <OBJECT>
 * 1: Is item to be loaded as ViV? <BOOL> (default: false)
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * cursorObject call ace_cargo_fnc_addCargoVehiclesActions
 *
 * Public: No
 */

params ["_vehicle", ["_isViv", false]];

private _statement = compile format [QUOTE([ARR_4(_this select 1,_this select 0,_this select 2,%1)] call FUNC(startLoadIn)), _isViv];

private _vehicles = (nearestObjects [_vehicle, GVAR(cargoHolderTypes), MAX_LOAD_DISTANCE + 10]) select {
    _x != _vehicle &&
    {alive _x} &&
    {locked _x < 2} &&
    {
        if (_isViv) then {
            (_x canVehicleCargo _vehicle) select 0
        } else {
            _x getVariable [QGVAR(hasCargo), getNumber (configOf _x >> QGVAR(hasCargo)) == 1]
        }
    } &&
    {([_vehicle, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
};

[_vehicles, _statement, _vehicle] call EFUNC(interact_menu,createVehiclesActions) // return
