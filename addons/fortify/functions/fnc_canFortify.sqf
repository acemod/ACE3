#include "..\script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player can fortify.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Cost <NUMBER> (default: 0)
 *
 * Return Value:
 * Can Fortify <BOOL>
 *
 * Example:
 * [player] call ace_fortify_fnc_canFortify
 *
 * Public: Yes
 */

params ["_player", ["_cost", 0]];

(missionNamespace getVariable [QGVAR(fortifyAllowed), true]) &&
{
    private _items = _player call EFUNC(common,uniqueItems);
    _items append weapons _player;
    _items pushBack backpack _player;
    GVAR(fortifyTools) findAny _items != -1
} && {
    private _budget = [side group _player] call FUNC(getBudget);
    ((_budget == -1) || {_budget >= _cost})
} && {
    private _inArea = GVAR(locations) isEqualTo [];
    {
        if (_player inArea _x) exitWith {_inArea = true};
    } forEach GVAR(locations);
    _inArea
}
