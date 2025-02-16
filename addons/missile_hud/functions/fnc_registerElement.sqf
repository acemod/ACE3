#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Register an element which will be drawn when the HUD is displayed.
 * 
 * Setup and condition function are called every time the HUD appears
 * Arguments to condition and setup function are `[player, vehicle, weapon]`
 * Arguments to generator function are `[player, vehicle, weapon, additional]` where `additional` is whatever was returned from the setup function
 * Generator function creates elements of type ["TEXT", "My Text", [r, g, b]] or ["ICON", "/path/to/icon", [r, g, b]]
 * Generator function returns array of elements which will be grouped on the same line. If the line overflows, the line will break to fit.
 *
 * Arguments:
 * 0: Setup Condition <CODE>
 * 1: Setup Function <CODE>
 * 2: Generator function <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{ params ["_unit", "_vehicle"]; _unit == gunner _vehicle }, { [_this, 123] }, { params ["_vars", "_myVar"]; ["TEXT", format ["Hello, world! %1", _myVar], [1, 0, 0]] }] call ace_missile_hud_fnc_registerElement
 *
 * Public: Yes
 */

params ["_condition", "_setup", "_generator"];
TRACE_2("registerElement",_condition,_generator);

GVAR(generators) pushBack [_condition, _setup, _generator];
[ACE_PLAYER] call FUNC(showVehicleHud);

