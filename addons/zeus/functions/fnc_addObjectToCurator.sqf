#include "script_component.hpp"
/*
 * Author: Glowbal
 * Adds an object to curator upon spawn
 *
 * Arguments:
 * Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_zeus_fnc_addObjectToCurator
 *
 * Public: No
 */

params ["_object"];

if (!(_object getVariable [QGVAR(addObject), GVAR(autoAddObjects)])) exitWith {};

[{
    TRACE_1("Delayed addCuratorEditableObjects",_this);
    {
        _x addCuratorEditableObjects [[_this], true];
    } forEach allCurators;
}, _object] call CBA_fnc_execNextFrame;
