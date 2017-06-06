/*
 * Author: Glowbal
 * Stack group switches. Will always trace back to original group.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: switch <BOOLEAN>
 * 2: id <STRING>
 * 3: side <SIDE>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_unit", objNull], ["_switch", false], ["_id", ""], ["_side", sideUnknown]];

private _previousGroupsList = _unit getVariable [QGVAR(previousGroupSwitchTo), []];

if (_switch) then {
    // go forward
    private _previousGroup = group _unit;
    private _originalSide = side group _unit;

    if (count units _previousGroup == 1 && _originalSide == _side) exitWith {
        [format ["Current group has only 1 member and is of same side as switch. Not switching unit %1", _id]] call FUNC(debug);
    };

    private _newGroup = createGroup _side;
    [_unit] joinSilent _newGroup;

    _previousGroupsList pushBack [_previousGroup, _originalSide, _id, true];
    _unit setVariable [QGVAR(previousGroupSwitchTo), _previousGroupsList, true];
} else {
    // go one back
    {
        if (_id == (_x select 2)) exitWith {
            _x set [ 3, false];
            _previousGroupsList set [_forEachIndex, _x];
            [format["found group with ID: %1", _id]] call FUNC(debug);
        };
    } forEach _previousGroupsList;

    reverse _previousGroupsList;

    {
        if (_x select 3) exitWith {}; // stop at first id set to true
        if !(_x select 3) then {
            private _currentGroup = group _unit;
            if (!isNull (_x select 0)) then {
                [_unit] joinSilent (_x select 0);
            } else {
                private _newGroup = createGroup (_x select 1);
                [_unit] joinSilent _newGroup;
            };
            if (count units _currentGroup == 0) then {
                deleteGroup _currentGroup;
            };
            _previousGroupsList set [_forEachIndex, objNull];
        };
    } forEach _previousGroupsList;

    _previousGroupsList = _previousGroupsList - [objNull];
    reverse _previousGroupsList;    // we have to reverse again, to ensure the list is in the right order.

    _unit setVariable [QGVAR(previousGroupSwitchTo), _previousGroupsList, true];
};
