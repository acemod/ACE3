/*
 * Author: SilentSpike
 * Set the cargo size of any object, only affects the local machine unless specified.
 * Adds the load action menu if necessary.
 * Negative size makes unloadable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo size <NUMBER>
 * 2: Apply globally <BOOL> (Default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, 3, true] call ace_cargo_fnc_setSize
 *
 * Public: Yes
 */
#include "script_component.hpp"

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setSize), _this];
};

params [
    ["_object",objNull,[objNull]],
    ["_size",nil,[0]], // Default can't be a number since all are valid
    ["_global",false,[true]]
];

if (isNull _object) exitWith {};

// Size matters
private _currentSize = _object getVariable [QGVAR(size), [_object] call FUNC(getSizeItem)];
if (isNil "_size") then {
    _size = _currentSize;
};

// If specified, apply new size on all machines
if (_size != _currentSize) then {
    _object setVariable [QGVAR(size), _size, _global];
    _object setVariable [QGVAR(canLoad), _size >= 0, _global]
};

// Add the load action menu if necessary
[_object] call FUNC(initObject);

// And globally if specified
if (_global) then {
    [QGVAR(initObject), [_object]] call CBA_fnc_remoteEvent;
};
