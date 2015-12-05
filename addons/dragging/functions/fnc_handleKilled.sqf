/*
 * Author: commy2
 *
 * Handle death of the dragger
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_dragging_fnc_handleKilled;
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isDragging), false]) then {
    private "_draggedObject";
    _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

    [_unit, _draggedObject] call FUNC(dropObject);
};

if (_unit getVariable [QGVAR(isCarrying), false]) then {
    private "_carriedObject";
    _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

    [_unit, _carriedObject] call FUNC(dropObject_carry);
};
