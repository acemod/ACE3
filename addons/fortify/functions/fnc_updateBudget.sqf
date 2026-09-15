#include "..\script_component.hpp"
/*
 * Author: Kingsley
 * Updates the given sides budget.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Change <NUMBER> (default: 0)
 * 2: Display hint <BOOL> (default: true)
 * 3: Tokens to return (only when adding) <NUMBER> (default: 0)
 *
 * Return Value:
 * Tokens used <NUMBER>
 *
 * Example:
 * [west, -250, false] call ace_fortify_fnc_updateBudget
 *
 * Public: Yes
 */

params [["_side", sideUnknown, [sideUnknown]], ["_change", 0, [0]], ["_hint", true, [true]], ["_tokensUsed", 0, [0]]];
TRACE_3("updateBudget",_side,_change,_hint);

if (_side isEqualTo sideUnknown) exitWith { ERROR("Unknown side"); 0 };

private _budget = [_side, "side"] call FUNC(getBudget);
if (_budget == -1) exitWith { 0 };

if (_change < 0) then {
    while {_change < 0} do {
        if (!([ACE_player, "ACE_FortifyToken"] call CBA_fnc_removeItem)) exitWith {};
        _tokensUsed = _tokensUsed + 5;
        _change = _change + 5;
    };
} else {
    while {_tokensUsed > 0 && _change > 0} do {
        [ACE_player, "ACE_FortifyToken", true] call CBA_fnc_addItem;
        _tokensUsed = _tokensUsed - 5;
        _change = _change - 5;
    };
};

if (_change == 0) exitWith { _tokensUsed };

private _newBudget = _budget + _change;
_newBudget = 0 max _newBudget;

if (_budget != -1) then {
    missionNamespace setVariable [format [QGVAR(Budget_%1), _side], _newBudget, true];

    if (_hint) then {
        [QGVAR(sideBudgetHint), [_side]] call CBA_fnc_globalEvent;
    };
};
_tokensUsed
