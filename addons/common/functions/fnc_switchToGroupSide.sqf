/**
 * fn_switchToGroupSide_f.sqf
 * @Descr: Stack group switches. Will always trace back to original group.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, switch BOOL, id STRING, side SIDE]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_previousGroup","_newGroup", "_currentGroup", "_originalSide", "_previousGroupsList"];
params [["_unit",ObjNull,[ObjNull]], ["_switch",false,[false]], ["_id","",[""]],["_side",side _unit,[west]]];

_previousGroupsList = _unit getvariable [QGVAR(previousGroupSwitchTo),[]];
if (_switch) then {
    // go forward
    _previousGroup = group _unit;
    _originalSide = side group _unit;

    if (count units _previousGroup == 1 && _originalSide == _side) exitwith {
        [format["Current group has only 1 member and is of same side as switch. Not switching unit %1", _id]] call FUNC(debug);
    };

    _newGroup = createGroup _side;
    [_unit] joinSilent _newGroup;

    _previousGroupsList pushback [_previousGroup, _originalSide, _id, true];
    _unit setvariable [QGVAR(previousGroupSwitchTo), _previousGroupsList, true];
} else {
    // go one back
    {
        if (_id == (_x select 2)) exitwith {
            _x set [ 3, false];
            _previousGroupsList set [_foreachIndex, _x];
            [format["found group with ID: %1", _id]] call FUNC(debug);
        };
    }foreach _previousGroupsList;
    reverse _previousGroupsList;

    {
        if (_x select 3) exitwith {}; // stop at first id set to true
        if !(_x select 3) then {
            _currentGroup = group _unit;
            if (!isNull (_x select 0)) then {
                [_unit] joinSilent (_x select 0);
            } else {
                _newGroup = createGroup (_x select 1);
                [_unit] joinSilent _newGroup;
            };
            if (count units _currentGroup == 0) then {
                deleteGroup _currentGroup;
            };
            _previousGroupsList set [_foreachIndex, ObjNull];
        };
    }foreach _previousGroupsList;
    _previousGroupsList = _previousGroupsList - [objNull];
    reverse _previousGroupsList;    // we have to reverse again, to ensure the list is in the right order.
    _unit setvariable [QGVAR(previousGroupSwitchTo), _previousGroupsList, true];
};
