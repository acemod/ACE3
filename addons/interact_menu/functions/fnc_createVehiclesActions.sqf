/*
 * Author: Dystopian
 * Creates child actions for vehicle list.
 * Statement gets vehicle as action parameter.
 *
 * Arguments:
 * 0: Vehicle list <ARRAY>
 * 1: Statement <CODE>
 * 2: Target <OBJECT>
 *
 * Return Value:
 * Array of actions <ARRAY>
 *
 * Example:
 * [nearestObjects [player, ["AllVehicles"], 10], {}, cursorObject] call ace_interact_menu_fnc_createVehiclesActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicles", "_statement", "_target"];

_vehicles apply {
    private _config = configFile >> "CfgVehicles" >> typeOf _x;
    private _name = getText (_config >> "displayName");
    private _ownerName = [_x, true] call EFUNC(common,getName);
    if ("" != _ownerName) then {
        _name = format ["%1 (%2)", _name, _ownerName];
    };
    private _icon = (getText (_config >> "icon")) call BIS_fnc_textureVehicleIcon;
    private _action = [format ["%1", _x], _name, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    [_action, [], _target]
}
