/*
 * Author: commy2
 *
 * Handle the Event if player is Changed
 *
 * Arguments:
 * 0: New Player Unit <OBJECT>
 * 1: Old Player Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unitNew, _unitOld] call ace_dragging_fnc_handlePlayerChanged;
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_newPlayer", "_oldPlayer"];

{
    if (_x getVariable [QGVAR(isDragging), false]) then {
        [_x, _x getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    };

    if (_x getVariable [QGVAR(isCarrying), false]) then {
        [_x, _x getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry);
    };
} forEach [_newPlayer, _oldPlayer];
