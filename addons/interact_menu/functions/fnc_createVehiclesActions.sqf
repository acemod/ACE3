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

_vehicles apply {
    private _name = getText ((configOf _x) >> "displayName");
    private _ownerName = [_x, true] call EFUNC(common,getName);
    private _distanceStr = (ACE_player distance _x) toFixed 1;
    if ("" != _ownerName) then {
        _name = format ["%1 (%2, %3m)", _name, _ownerName, _distanceStr];
    } else {
        _name = format ["%1 (%2m)", _name, _distanceStr];
    };
    private _icon = [_x] call EFUNC(common,getVehicleIcon);
    private _action = [str _x, _name, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    [_action, [], _target]
}
