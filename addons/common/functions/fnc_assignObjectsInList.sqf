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
 *
 * Return Value:
 * None
 *
 * Example:
 * ["text", "variable", value, true] call ace_common_fnc_assignObjectsInList
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_list", "_variable", "_setting", "_global"];

if (typeName _list == "STRING") then {
    _list = [_list, true, true] call FUNC(parseList);
    TRACE_1("Parsed",_list)
};

{
    if (!isNil "_x") then {
        if (typeName _x == typeName objNull) then {
            if (local _x) then {
                _x setVariable [_variable, _setting, _global];
                TRACE_4("Set variable",_x,_variable,_setting,_global);
            };
        };
    };
} count _list;
