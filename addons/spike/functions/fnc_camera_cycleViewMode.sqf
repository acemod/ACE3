#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Cycles camera thermal mode (if available)
 *
 * Arguments:
 * 0: Camera <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_cycleViewMode
 *
 * Public: No
 */
params ["_cameraNamespace"];

private _tiIndex = _cameraNamespace getVariable [QGVAR(currentTIModeIndex), 0];
private _tiArray = _cameraNamespace getVariable [QGVAR(thermalTypes), []];

if (_tiArray isEqualTo []) exitWith {};

if ((_tiIndex + 1) >= count _tiArray) then {
    _tiIndex = 0;
} else {
    _tiIndex = _tiIndex + 1;
};

_cameraNamespace setVariable [QGVAR(currentTIModeIndex), _tiIndex];

[_cameraNamespace, _tiArray select _tiIndex] call FUNC(camera_setViewMode);
