#include "script_component.hpp"
/*
 * Author: commy2
 * Handle player changes.
 *
 * Arguments:
 * 0: New Player Unit <OBJECT>
 * 1: Old Player Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_newPlayer, _oldPlayer] call ace_dragging_fnc_handlePlayerChanged;
 *
 * Public: No
*/

params ["_newPlayer", "_oldPlayer"];
TRACE_2("params",_newPlayer,_oldPlayer);

{
    if (_x getVariable [QGVAR(isDragging), false]) then {
        [_x, _x getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    };

    if (_x getVariable [QGVAR(isCarrying), false]) then {
        [_x, _x getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry);
    };
} forEach [_newPlayer, _oldPlayer];
