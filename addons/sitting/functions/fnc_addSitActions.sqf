/*
 * Author: Jonpas
 * Adds sit actions.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat] call ace_sitting_fnc_addSitActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seat"];
private ["_type", "_sitAction"];

_type = typeOf _seat;

// Exit if the object is not specified as a seat
if (getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(canSit)) != 1) exitWith {};

// Exit if class already initialized
if (_type in GVAR(initializedClasses)) exitWith {};

GVAR(initializedClasses) pushBack _type;

_sitAction = [
    QGVAR(Sit),
    localize LSTRING(Sit),
    QUOTE(PATHTOF(UI\sit_ca.paa)),
    {_this call FUNC(sit)},
    {_this call FUNC(canSit)},
    {},
    [],
    [0, 0, 0],
    1.5
] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _sitAction] call EFUNC(interact_menu,addActionToClass);
