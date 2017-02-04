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
private ["_statement", "_actions", "_name", "_ownerName", "_icon", "_action"];

_statement = {
    params ["_target", "_player", "_params"];
    _params params ["_vehicle"];
    [_player, _target, _vehicle] call FUNC(startLoadIn);
};

_actions = [];

{
    _name = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
    _ownerName = [_x, true] call EFUNC(common,getName);
    if ("" != _ownerName) then {
        _name = format ["%1 (%2)", _name, _ownerName];
    };
    _icon = (getText (configFile >> "CfgVehicles" >> typeOf _x >> "icon")) call BIS_fnc_textureVehicleIcon;
    _action = [format ["%1", _x], _name, _icon, _statement, {true}, {}, [_x]] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
    false
} count (_player nearEntities [["Car", "Air", "Tank", "Ship", "Cargo_base_F"], MAX_LOAD_DISTANCE]);

_actions
