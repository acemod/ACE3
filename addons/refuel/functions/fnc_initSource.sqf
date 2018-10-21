#include "script_component.hpp"
/*
 * Author: Dystopian
 * Adds refuel menu to object.
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_refuel_fnc_initSource
 *
 * Public: No
 */

if (!hasInterface) exitWith {};

params ["_source"];
TRACE_2("init",_source,typeOf _source);

[_source, 0, ["ACE_MainActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToObject);
{
    [_source, 0, ["ACE_MainActions", QGVAR(Refuel)], _x] call EFUNC(interact_menu,addActionToObject);
} forEach GVAR(actions);
