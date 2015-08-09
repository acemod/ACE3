/*
 * Author: commy2
 *
 * Handle the Animaion for a Unit for Dragging Module
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animaion <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "amovpercmstpsnonwnondnon"] call ace_dragging_fnc_handleAnimChanged;
 *
 * Public: No
*/
#include "script_component.hpp"

private ["_unit", "_anim"];

_unit = _this select 0;
_anim = _this select 1;

if (_unit getVariable [QGVAR(isDragging), false]) then {

    // drop dragged object when not in valid animation
    if !(_anim in DRAG_ANIMATIONS) then {
        private "_draggedObject";
        _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

        if (!isNull _draggedObject) then {
            [_unit, _draggedObject] call FUNC(dropObject);
        };
    };

};

if (_unit getVariable [QGVAR(isCarrying), false]) then {

    // drop carried object when not standing; also some exceptions when picking up crate
    if (stance _unit != "STAND" && {_anim != "amovpercmstpsnonwnondnon"}) then {
        private "_carriedObject";
        _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

        if (!isNull _carriedObject) then {
            [_unit, _carriedObject] call FUNC(dropObject_carry);
        };
    };

};
