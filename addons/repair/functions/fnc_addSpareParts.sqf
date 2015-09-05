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
#include "script_component.hpp"

private ["_part"];
params ["_vehicle", ["_amount", 1], ["_part", ""], ["_force", false]];
TRACE_2("params",_vehicle,_amount);

// Exit if ace_cargo is not loaded
if !(["ace_cargo"] call EFUNC(common,isModLoaded)) exitWith {};

// Collect until SettingsInitialized
if (isNil QGVAR(settingInitted)) exitWith {
    if !(_vehicle in GVAR(addSparePartsCollection)) then {
        GVAR(addSparePartsCollection) pushBack _vehicle;
    };
};

// Exit if not forced and add spare parts is disabled (after settings initted to make sure it really is)
if (!_force && !GVAR(addSpareParts)) exitWith {};

// Select appropriate part
if (_part == "") then {
    if (_vehicle isKindOf "Car") then { _part = "ACE_Wheel" };
    if (_vehicle isKindOf "Tank") then { _part = "ACE_Track" };
};
// Exit if no appropriate part
if (_part == "") exitWith {};

// Load
["AddCargoByClass", [_part, _vehicle, _amount]] call EFUNC(common,localEvent);
