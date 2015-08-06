/*
 * Author: Glowbal
 * Grab available treatment options for given category
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Category name <STRING>
 *
 * Return Value:
 * Available actions <ARRAY>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_player", "_target", "_name", "_actions"];
_player = _this select 0;
_target = _this select 1;
_name = _this select 2;
if !([ACE_player, _target, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitwith {[]};

_actions = if (EGVAR(medical,level) == 2) then {
    GVAR(actionsAdvanced);
} else {
    GVAR(actionsBasic);
};

_collectedActions = [];

_bodyPart = EGVAR(medical,SELECTIONS) select GVAR(selectedBodyPart);
{
    if (_name == (_x select 1) && {call (_x select 2)}) then {
        _collectedActions pushback _x;
    };
}foreach _actions;

_collectedActions;
