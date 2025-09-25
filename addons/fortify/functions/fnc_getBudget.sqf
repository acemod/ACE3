#include "..\script_component.hpp"
/*
 * Author: Kingsley
 * Gets the budget for the given side.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Type <STRING> (default: "")
 *
 * Return Value:
 * Budget <NUMBER>
 *
 * Example:
 * [west] call ace_fortify_fnc_getBudget
 *
 * Public: Yes
 */

params ["_side", ["_type", "", [""]]];

private _budget = 0;
if (_type in ["", "side"]) then {
    _budget = (missionNamespace getVariable [format [QGVAR(Budget_%1), _side], -1]);
};
if (_budget != -1 && {_type in ["", "player"]}) then {
    _budget = _budget + 5 * ({_x == "ACE_FortifyToken"} count items ACE_player);
};
_budget
