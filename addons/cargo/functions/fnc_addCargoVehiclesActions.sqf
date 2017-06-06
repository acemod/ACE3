/*
 * Author: Dystopian
 * Create actions for nearest vehicles with cargo.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [target, player] call ace_cargo_fnc_addCargoVehiclesActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player"];

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_vehicle"];
    [_player, _target, _vehicle] call FUNC(startLoadIn);
};

private _actions = [];

{
    private _config = configFile >> "CfgVehicles" >> typeOf _x;
    private _hasCargoPublic = _x getVariable [QGVAR(hasCargo), false];
    private _hasCargoConfig = getNumber (_config >> QGVAR(hasCargo)) == 1;
    if ((_hasCargoPublic || _hasCargoConfig) && {_x != _target}) then {
        private _name = getText (_config >> "displayName");
        private _ownerName = [_x, true] call EFUNC(common,getName);
        if ("" != _ownerName) then {
            _name = format ["%1 (%2)", _name, _ownerName];
        };
        private _icon = (getText (_config >> "icon")) call BIS_fnc_textureVehicleIcon;
        private _action = [format ["%1", _x], _name, _icon, _statement, {true}, {}, [_x]] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach (nearestObjects [_player, CARGO_VEHICLE_CLASSES, MAX_LOAD_DISTANCE]);

_actions
