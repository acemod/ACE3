/*
 * Author: chris579
 * Initializes the Markers Module.
 *
 * Arguments:
 * 0: Logic <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ACE_markers_fnc_initModule
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

[_logic, QGVAR(movableMarkersEnabled), "MovableMarkersEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(moveRestriction), "MoveRestriction"] call EFUNC(common,readSettingFromModule);
