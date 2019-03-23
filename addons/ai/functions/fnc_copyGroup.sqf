#include "script_component.hpp"
/*
 * Author: commy2
 * Copy a group and its units.
 *
 * Arguments:
 *  0: A group <GROUP>
 *
 * Return Value:
 *  Group data <ARRAY>
 *
 * Example:
 *  private _groupData = _group call ace_ai_fnc_copyGroup;
 *
 * Public: Yes
 */

params [["_group", grpNull, [grpNull, objNull]]];

private _side = SIDES find side _group;

if (_side == -1) then {
    _side = 1;
};

private _groupData = [
    _side,
    behaviour leader _group,
    combatMode _group
];

private _unitsData = units _group apply {[
    typeOf _x,
    getPosWorld _x,
    getDir _x,
    skill _x,
    getUnitLoadout _x
]};

_groupData + [_unitsData]
