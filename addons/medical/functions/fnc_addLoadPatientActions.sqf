/*
 * Author: 654wak654
 * Adds child actions to the "load patient" action for near vehicles
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * The child actions
 *
 * Example:
 * [bob, kevin] call ace_medical_fnc_addLoadPatientActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    [_player, _target, _vehicle] call FUNC(actionLoadUnit);
};

private _actions = [];

{
    private _config = configFile >> "CfgVehicles" >> typeOf _x;

    private _name = getText (_config >> "displayName");
    private _ownerName = [_x, true] call EFUNC(common,getName);
    if (_ownerName != "") then {
        _name = format ["%1 (%2)", _name, _ownerName];
    };
    private _icon = (getText (_config >> "icon")) call BIS_fnc_textureVehicleIcon;

    private _action = [format ["%1", _x], _name, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _target];
} forEach (_target call EFUNC(common,nearestVehiclesFreeSeat));

_actions
