#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds spare parts to the vehicle. Before SettingsInitialized only collect for later execution.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Amount <NUMBER> (default: 1)
 * 2: Spare Part Classname <STRING> (default: "")
 * 3: Force (add even if setting is disabled) <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_repair_fnc_addSpareParts
 *
 * Public: No
 */

params ["_vehicle", ["_amount", 1], ["_part", ""], ["_force", false]];
TRACE_2("params",_vehicle,_amount);

// Exit if ace_cargo is not loaded or no part supplied
if (!(["ace_cargo"] call EFUNC(common,isModLoaded)) || {_part == ""}) exitWith {};

// Collect until SettingsInitialized
if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addSpareParts), _this];
};

// Exit if not forced and add spare parts is disabled (after settings initted to make sure it really is)
if (!_force && !GVAR(addSpareParts)) exitWith {};

// Load
[{
    ["ace_addCargo", _this] call CBA_fnc_localEvent;
}, [_part, _vehicle, _amount]] call CBA_fnc_execNextFrame;
