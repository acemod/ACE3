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
 * Example:
 * [ACE_player, poor_dude, "some category"] call ace_medical_menu_fnc_getTreatmentOptions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_target", "_name"];

if (!([ACE_player, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith))) exitWith {[]};

private _collectedActions = [];
private _bodyPart = ALL_SELECTIONS select GVAR(selectedBodyPart);
{
    _x params ["", "_currentCategory", "_currentCondition"];
    if (_name == _currentCategory && {call _currentCondition}) then {
        _collectedActions pushBack _x;
    };
    nil
} count GVAR(actions);

_collectedActions;
