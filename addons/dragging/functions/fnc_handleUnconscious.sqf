#include "script_component.hpp"
/*
 * Author: commy2
 * Handle the Unconscious of a Unit while Dragging
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_dragging_fnc_handleUnconscious;
 *
 * Public: No
*/

params ["_unit"];

private _player = ACE_player;

if (_player getVariable [QGVAR(isDragging), false]) then {

    private _draggedObject = _player getVariable [QGVAR(draggedObject), objNull];

    // handle falling unconscious
    if (_unit == _player) then {
        [_unit, _draggedObject] call FUNC(dropObject);
    };

    // handle waking up dragged unit
    //if (_unit == _draggedObject) then {
        // [_player, _draggedObject] call FUNC(dropObject);
    //};

};

if (_player getVariable [QGVAR(isCarrying), false]) then {

    private _carriedObject = _player getVariable [QGVAR(carriedObject), objNull];

    // handle falling unconscious
    if (_unit == _player) then {
        [_unit, _carriedObject] call FUNC(dropObject_carry);
    };

    // handle waking up dragged unit
    //if (_unit == _carriedObject) then {
        // [_player, _carriedObject] call FUNC(dropObject_carry);
    //};

};
