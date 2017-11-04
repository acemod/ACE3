/*
 * Author: commy2
 * Handle the animaion for a Unit for Dragging Module
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: animaion <STRING>
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

//IGNORE_PRIVATE_WARNING ["_thisArgs", "_thisID"]; // From CBA_fnc_addBISEventHandler;

params ["_unit", "_anim"];
_thisArgs params ["_realUnit"];
TRACE_4("params",_unit,_anim,_realUnit,_thisID);

if (_unit != _realUnit) exitWith {
    TRACE_2("respawn (unit changed) - remove EH",_unit,_realUnit);
    _unit removeEventHandler ["AnimChanged", _thisID];
};

if (_unit getVariable [QGVAR(isDragging), false]) then {

    // drop dragged object when not in valid animation
    if (!(_anim in DRAG_ANIMATIONS) && {!(_unit call EFUNC(common,isSwimming))}) then {
        private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

        if (!isNull _draggedObject) then {
            TRACE_2("stop drag",_unit,_draggedObject);
            [_unit, _draggedObject] call FUNC(dropObject);
        };
    };
} else {

    if (_unit getVariable [QGVAR(isCarrying), false]) then {

        // drop carried object when not standing; also some exceptions when picking up crate
        if (stance _unit != "STAND" && {_anim != "amovpercmstpsnonwnondnon"}) then {
            private _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

            if (!isNull _carriedObject) then {
                TRACE_2("stop carry",_unit,_carriedObject);
                [_unit, _carriedObject] call FUNC(dropObject_carry);
            };
        };
    } else {
        TRACE_1("not drag/carry - remove EH",_unit);
        _unit removeEventHandler ["AnimChanged", _thisID];
    };
};
