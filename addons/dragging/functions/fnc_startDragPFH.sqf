#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks for dragging conditions. If these are met, the unit will start dragging. Called from ace_dragging_fnc_startDrag.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Unit <OBJECT>
 * - 1: Target <OBJECT>
 * - 2: Timeout <NUMBER>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, cursorTarget, 10], _idPFH] call ace_dragging_fnc_startDragPFH;
 *
 * Public: No
 */

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startDragPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// Handle aborting drag
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    TRACE_4("drag false",_unit,_target,_timeOut,CBA_missionTime);
    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Drop if the target is destroyed or if the target moved away from carrier (e.g. weapon disassembled)
if (!alive _target || {_unit distance _target > 10}) exitWith {
    TRACE_4("dead/distance",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Timeout: Drop target. CBA_missionTime, because anim length is linked to ingame time
if (CBA_missionTime > _timeOut) exitWith {
    TRACE_4("timeout",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Unit is ready to start dragging
if (animationState _unit in DRAG_ANIMATIONS || {_unit call EFUNC(common,isSwimming)}) exitWith {
    TRACE_4("Start Dragging",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dragObject);

    _idPFH call CBA_fnc_removePerFrameHandler;
};
