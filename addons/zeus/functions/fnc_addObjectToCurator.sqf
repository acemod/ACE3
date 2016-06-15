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
 * Public: No
 */

#include "script_component.hpp"

params ["_object"];

if !(EGVAR(common,settingsInitFinished)) exitWith {
    TRACE_1("pushing to runAtSettingsInitialized", _this);
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addObjectToCurator), _this];
};

if (!(_object getVariable [QGVAR(addObject), GVAR(autoAddObjects)])) exitWith {};

[{
    TRACE_1("Delayed addCuratorEditableObjects",_this);
    {
        _x addCuratorEditableObjects [[_this], true];
    } forEach allCurators;
}, _object] call CBA_fnc_execNextFrame;
