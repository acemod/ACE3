/*
 * Author: Glowbal
 * Initializes variables for loadable objects. Called from init EH.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_initObject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];
private _type = typeOf _object;
TRACE_2("params",_object,_type);

// If object had size given to it via eden then override config canLoad setting
private _canLoadEden = _object getVariable [QGVAR(size), -1] >= 0;
private _canLoadConfig = _object getVariable [QGVAR(canLoad), getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(canLoad))] == 1;

// Nothing to do here if object can't be loaded
if !(_canLoadConfig || _canLoadEden) exitWith {};

// Servers and HCs do not require action menus (beyond this point)
if !(hasInterface) exitWith {};

// Unnecessary to add actions to an object class that's already got them
if (_type in GVAR(initializedItemClasses)) exitWith {};

// Objects given size via eden have their actions added to the object
// So this function may run for multiple of the same class in that case
if (_canLoadConfig) then {
    GVAR(initializedItemClasses) pushBack _type;
    TRACE_1("Adding load cargo action to class", _type);
};

private _condition = {
    GVAR(enable) &&
    {(_target getVariable [QGVAR(canLoad), getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(canLoad))]) == 1} &&
    {locked _target < 2} &&
    {alive _target} &&
    {[_player, _target, []] call EFUNC(common,canInteractWith)}
};
private _statement = {
    params ["_target", "_player"];
    [_player, _target] call FUNC(startLoadIn);
};
private _text = localize LSTRING(loadObject);
private _icon = QPATHTOF(UI\Icon_load.paa);

private _action = [QGVAR(load), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
if (_canLoadConfig) then {
    [_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
} else {
    [_object, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToObject);
};

