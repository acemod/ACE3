// by commy2
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startDragPFH running", ACE_time];
#endif

private ["_unit", "_target", "_timeOut"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;
_timeOut = _this select 0 select 2;

// handle aborting drag
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if ((!([_target] call EFUNC(common,isAlive))) || {(_unit distance _target) > 10}) then {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// timeout. Do nothing. Quit. ACE_time, because anim length is linked to ingame ACE_time.
if (ACE_time > _timeOut) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    // drop if in timeout
    private "_draggedObject";
    _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
    [_unit, _draggedObject] call FUNC(dropObject);
};

// unit is ready to start dragging
if (animationState _unit in DRAG_ANIMATIONS) exitWith {
    [_unit, _target] call FUNC(dragObject);

    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
