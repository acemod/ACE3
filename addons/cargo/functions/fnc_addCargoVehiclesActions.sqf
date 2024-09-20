#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Creates actions for nearest vehicles with cargo.
 *
 * Arguments:
 * 0: Holder object (vehicle) <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * cursorObject call ace_cargo_fnc_addCargoVehiclesActions
 *
 * Public: No
 */

params ["_vehicle"];

private _statement = {
    params ["_item", "_loader", "_vehicle"];

    [_loader, _item, _vehicle] call FUNC(startLoadIn);
};

private _vehicles = (nearestObjects [_vehicle, GVAR(cargoHolderTypes), MAX_LOAD_DISTANCE + 10]) select {
    _x != _vehicle &&
    {alive _x} &&
    {locked _x < 2} &&
    {_x getVariable [QGVAR(hasCargo), getNumber (configOf _x >> QGVAR(hasCargo)) == 1]} &&
    {([_vehicle, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
};

[_vehicles, _statement, _vehicle] call EFUNC(interact_menu,createVehiclesActions)
