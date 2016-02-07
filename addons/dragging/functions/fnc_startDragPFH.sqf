/*
 * Author: commy2
 * Drag PFH
 *
 * Arguments:
 * 0: ARGS <ARRAY>
 *  0: Unit <OBJECT>
 *  1: Target <OBJECT>
 *  2: Timeout <NUMBER>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, target, 100], 20] call ace_dragging_fnc_startDragPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startDragPFH running", ACE_time];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// handle aborting drag
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    TRACE_4("drag false",_unit,_target,_timeOut,ACE_time);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_4("dead/distance",_unit,_target,_timeOut,ACE_time);
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// timeout. Do nothing. Quit. ACE_time, because anim length is linked to ingame time.
if (ACE_time > _timeOut) exitWith {
    TRACE_4("timeout",_unit,_target,_timeOut,ACE_time);
    [_idPFH] call CBA_fnc_removePerFrameHandler;

    // drop if in timeout
    private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
    [_unit, _draggedObject] call FUNC(dropObject);
};

// unit is ready to start dragging
if (animationState _unit in DRAG_ANIMATIONS) exitWith {
    TRACE_4("Start Dragging",_unit,_target,_timeOut,ACE_time);
    [_unit, _target] call FUNC(dragObject);

    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
