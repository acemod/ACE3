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
 * [logic] call ace_repair_fnc_moduleAddSpareParts
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if (!isNull _logic) then {
    private _list = _logic getVariable ["List", ""];
    private _part = _logic getVariable ["Part", 0];
    private _amount = _logic getVariable ["Amount", 1];

    // Parse list
    _list = [_list, true, true] call EFUNC(common,parseList);

    // Add synchronized objects to list
    {
        _list pushBack _x;
        nil
    } count (synchronizedObjects _logic);

    if (_list isEqualTo []) exitWith {};

    TRACE_3("Module info parsed",_list,_part,_amount);

    // Add spare parts
    {
        [_x, _amount, _part, true] call FUNC(addSpareParts);
        false
    } count _list;
};
