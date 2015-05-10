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
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_logic","_list","_splittedList","_nilCheckPassedList","_objects","_setting"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (!isNull _logic) then {
    _list = _logic getvariable ["EnableList",""];

    _splittedList = [_list, ","] call BIS_fnc_splitString;
    _nilCheckPassedList = "";
    {
        _x = [_x] call EFUNC(common,stringRemoveWhiteSpace);
        if !(isnil _x) then {
            if (_nilCheckPassedList == "") then {
                _nilCheckPassedList = _x;
            } else {
                _nilCheckPassedList = _nilCheckPassedList + ","+ _x;
            };
        };
    }foreach _splittedList;

    _list = "[" + _nilCheckPassedList + "]";
    _objects = [] call compile _list;
    _setting = _logic getvariable ["enabled", false];
    _objects append (synchronizedObjects _logic);
    {
        if (!isnil "_x") then {
               if (typeName _x == typeName objNull) then {
                if (local _x) then {
                    _x setvariable [QGVAR(medicClass), _setting, true];
                };
            };
        };
    }foreach _objects;
};

true