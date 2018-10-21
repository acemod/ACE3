#include "script_component.hpp"
/*
 * Author: Glowbal
 * Loops through a string and filters out object names/variables to assign a value for given variable.
 * Used by moduleAssign* within various parts of the ACE3 project.
 *
 * Arguments:
 * 0: List <STRING>
 * 1: Variable Name <STRING>
 * 2: Value <ANY>
 * 3: Global <BOOL>
 * 4: Vehicle <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["text", "variable", value, true] call ace_common_fnc_assignObjectsInList
 *
 * Public: No
 */

params ["_list", "_variable", "_setting", "_global", ["_vehicle", false]];

if (_list isEqualType "") then {
    _list = [_list, true, true] call FUNC(parseList);
    TRACE_1("Parsed",_list)
};

{
    if (!isNil "_x") then {
        if (_x isEqualType objNull) then {
            if (local _x) then {
                if (_vehicle) then {
                    (vehicle _x) setVariable [_variable, _setting, _global];
                    TRACE_6("Set variable vehicle",_x,vehicle _x,typeOf (vehicle _x),_variable,_setting,_global);
                } else {
                    _x setVariable [_variable, _setting, _global];
                    TRACE_5("Set variable",_x,typeOf _x,_variable,_setting,_global);
                };
            };
        };
    };
    false
} count _list;
