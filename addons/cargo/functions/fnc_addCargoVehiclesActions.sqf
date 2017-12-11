/*
 * Author: Dystopian
 * Create actions for nearest vehicles with cargo.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [cursorObject] call ace_cargo_fnc_addCargoVehiclesActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    [_player, _target, _vehicle] call FUNC(startLoadIn);
};

private _vehicles = (nearestObjects [_target, GVAR(cargoHolderTypes), (MAX_LOAD_DISTANCE + 10)]) select {
    private _hasCargoConfig = 1 == getNumber (configFile >> "CfgVehicles" >> typeOf _x >> QGVAR(hasCargo));
    private _hasCargoPublic = _x getVariable [QGVAR(hasCargo), false];
    (_hasCargoConfig || {_hasCargoPublic}) && {_x != _target} &&
    {([_target, _x] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
};

[_vehicles, _statement, _target] call EFUNC(interact_menu,createVehiclesActions)
