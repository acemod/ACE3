#include "..\script_component.hpp"
/*
 * Author: kymckay, Brett
 * Zeus module function to change side of a group on dialog confirmation
 *
 * Arguments:
 * 0: Unit to target <OBJECT>
 * 1: Chosen side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, west] call ace_zeus_fnc_moduleGroupSide
 *
 * Public: No
 */

params ["_unit", "_newSide"];
private _side = side _unit;

// Nothing to do here
if (_side == _newSide) exitWith {};

private _oldGroup = group _unit;
private _newGroup = createGroup _newSide;

// Preserve groupid from the previous group if doesn't already exist
if ((allGroups findIf {side _x isEqualTo _newSide && {(groupId _oldGroup) isEqualTo (groupId _newGroup)}}) == -1) then {
    _newGroup setGroupIdGlobal [groupId _oldGroup];
};

private _units = units _unit;

// Preserve assignedTeam for each unit
// Teams need to be gotten before removing units from group
private _teams = _units apply {
    private _team = assignedTeam _x;
    [_team, "MAIN"] select (_team == "")
};

{
    [_x] joinSilent _newGroup;
    _x assignTeam (_teams select _forEachIndex);
} forEach _units;

deleteGroup _oldGroup;
