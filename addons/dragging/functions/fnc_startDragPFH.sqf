#include "script_component.hpp"
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

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startDragPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// handle aborting drag
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    TRACE_4("drag false",_unit,_target,_timeOut,CBA_missionTime);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_4("dead/distance",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// timeout. Do nothing. Quit. CBA_missionTime, because anim length is linked to ingame time.
if (CBA_missionTime > _timeOut) exitWith {
    TRACE_4("timeout",_unit,_target,_timeOut,CBA_missionTime);
    [_idPFH] call CBA_fnc_removePerFrameHandler;

    // drop if in timeout
    private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
    [_unit, _draggedObject] call FUNC(dropObject);
};

// unit is ready to start dragging
if (animationState _unit in DRAG_ANIMATIONS || {_unit call EFUNC(common,isSwimming)}) exitWith {
    TRACE_4("Start Dragging",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dragObject);

    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
