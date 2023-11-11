#include "..\script_component.hpp"
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

_vehicles = _vehicles apply {[_x distanceSqr _target, _x]};
_vehicles sort true;

_vehicles apply {
    private _name = getText ((configOf (_x select 1)) >> "displayName");
    private _ownerName = [_x select 1, true] call EFUNC(common,getName);
    if ("" != _ownerName) then {
        _name = format ["%1 (%2)", _name, _ownerName];
    } else {
        _name = format ["%1 (%2m)", _name, sqrt (_x select 0) toFixed 1];
    };
    private _icon = [_x select 1] call EFUNC(common,getVehicleIcon);
    private _action = [format ["%1", _x select 1], _name, _icon, _statement, {true}, {}, _x select 1] call EFUNC(interact_menu,createAction);
    [_action, [], _target]
}
