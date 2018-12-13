#include "script_component.hpp"
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

params ["_vehicles", "_statement", "_target"];

_vehicles apply {
    private _type = typeOf _x;
    private _name = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
    private _ownerName = [_x, true] call EFUNC(common,getName);
    if ("" != _ownerName) then {
        _name = format ["%1 (%2)", _name, _ownerName];
    };
    private _icon = [_type] call EFUNC(common,getVehicleIcon);
    private _action = [format ["%1", _x], _name, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    [_action, [], _target]
}
