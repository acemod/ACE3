// by commy2
#include "script_component.hpp"

private ["_unit", "_target", "_timeOut"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;
_timeOut = _this select 0 select 2;

// timeout. Do nothing. Quit. time, because anim length is linked to ingame time.
if (time > _timeOut) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    // drop if in timeout
    private "_draggedObject";
    _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

    if (!isNull _draggedObject) exitWith {
        [_unit, _draggedObject] call FUNC(dropObject);
    };

    // re-enable everything
    _unit setVariable [QGVAR(isDragging), false, true];
};

// unit is ready to start dragging
if (animationState _unit in DRAG_ANIMATIONS) exitWith {
    [_unit, _target] call FUNC(dragObject);

    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
