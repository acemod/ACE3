#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Intercepts group heal attempts and replaces items
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_group", "_newCommand"];

if (!local _group) exitWith {};
if !(_newCommand in OVERRIDDEN_COMMANDS) exitWith {};

{
    _x call EFUNC(common,replaceRegisteredItems);
    private _assignedTeam = assignedTeam _x;
    [_x] joinSilent (leader _group);
    _x assignTeam _assignedTeam;
} forEach ((units _group) select {(currentCommand _x) == _newCommand});
