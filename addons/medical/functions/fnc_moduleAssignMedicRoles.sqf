/*
 * Author: Glowbal
 * Assign a medical role to a unit
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_setting", "_objects", "_list", "_splittedList", "_nilCheckPassedList", "_parsedList"];
params [["_logic", objNull, [objNull]]];

if (!isNull _logic) then {
    _list = _logic getVariable ["EnableList",""];

    _splittedList = [_list, ","] call BIS_fnc_splitString;
    _nilCheckPassedList = "";
    {
        _x = [_x] call EFUNC(common,stringRemoveWhiteSpace);
        if !(isNil _x) then {
            if (_nilCheckPassedList == "") then {
                _nilCheckPassedList = _x;
            } else {
                _nilCheckPassedList = _nilCheckPassedList + ","+ _x;
            };
        };
    } forEach _splittedList;

    _list = "[" + _nilCheckPassedList + "]";
    _parsedList = [] call compile _list;
    _setting = _logic getVariable ["role",0];
    _objects = synchronizedObjects _logic;
    if (!(_objects isEqualTo []) && _parsedList isEqualTo []) then {
        {
            if (!isNil "_x") then {
                   if (typeName _x == typeName objNull) then {
                    if (local _x) then {
                        _x setVariable [QGVAR(medicClass), _setting, true];
                    };
                };
            };
        } forEach _objects;
    };
    {
        if (!isNil "_x") then {
               if (typeName _x == typeName objNull) then {
                if (local _x) then {
                    _x setVariable [QGVAR(medicClass), _setting, true];
                };
            };
        };
    } forEach _parsedList;
 };
