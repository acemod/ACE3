/*
 * Author: Jonpas
 * Adds spare parts to a vehicle.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * function = "ace_repair_fnc_moduleAssignRepairVehicle"
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_logic"];

if (!isNull _logic) then {
    private ["_list", "_part", "_amount", "_nilCheckPassedList"];
    // Module settings
    _list = _logic getVariable ["List", ""];
    _part = _logic getVariable ["Part", 0];
    _amount = _logic getVariable ["Amount", 1];

    // Parse list
    _nilCheckPassedList = "";
    {
        _x = [_x] call EFUNC(common,stringRemoveWhiteSpace);
        if !(isnil _x) then {
            if (_nilCheckPassedList == "") then {
                _nilCheckPassedList = _x;
            } else {
                _nilCheckPassedList = _nilCheckPassedList + "," + _x;
            };
        };
    } forEach ([_list, ","] call BIS_fnc_splitString);
    _list = "[" + _nilCheckPassedList + "]";
    _list = [] call compile _list;

    // Add synchronized objects to list
    {
        _list pushBack _x;
    } forEach (synchronizedObjects _logic);

    if (_list isEqualTo []) exitWith {};

    TRACE_3("module info parsed",_list,_part,_amount);
    // Add spare parts
    {
        if (!isNil "_x" && {typeName _x == typeName objNull}) then {
            [_x, _amount, _part, true] call FUNC(addSpareParts);
        };
    } forEach _list;
};

true
