#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 * Disarm Event Handler, Starting func, called on the target.
 * If target has to remove uniform/vest, this will add all uniform/vest items to the drop list.
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "disarm"] call ace_disarming_fnc_eventTargetStart
 *
 * Public: No
 */

params ["_caller", "_target", "_listOfObjectsToRemove"];

private _itemsToAdd = [];
{
    if (_x == (uniform _target)) then {
        _itemsToAdd = _itemsToAdd + (uniformItems _target);
    };
    if (_x == (vest _target)) then {
        _itemsToAdd = _itemsToAdd + (vestItems _target);
    };
} forEach _listOfObjectsToRemove;

{
    if (!(_x in _listOfObjectsToRemove)) then {
        _listOfObjectsToRemove pushBack _x;
    };
} forEach _itemsToAdd;

[_caller, _target, _listOfObjectsToRemove] call FUNC(disarmDropItems);
