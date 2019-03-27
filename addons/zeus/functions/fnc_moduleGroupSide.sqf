#include "script_component.hpp"
/*
 * Author: SilentSpike, Brett
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

// Pretty hacky, will replace units return group with this new group if unconcious
if (GETVAR(_unit,ACE_isUnconscious,false) && {GETMVAR(EGVAR(medical,moveUnitsFromGroupOnUnconscious),false)}) then {
    private _previousGroupsList = _unit getVariable [QEGVAR(common,previousGroupSwitchTo), []];

    {
        if ("ACE_isUnconscious" == (_x select 2)) exitWith {
            _x set [0,_newGroup];
            _x set [1,_newSide];
            _previousGroupsList set [_forEachIndex, _x];
        };
    } forEach _previousGroupsList;

    _unit setVariable [QEGVAR(common,previousGroupSwitchTo), _previousGroupsList, true];
} else {
    // Preserve assignedTeam for each unit
    {
        private _team = assignedTeam _x;
        [_x] joinSilent _newGroup;
        _x assignTeam _team;
    } forEach units _unit;
    deleteGroup _oldGroup;
};
