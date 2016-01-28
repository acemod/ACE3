/*
 * Author: commy2
 * PFH for Drag Object
 *
 * Arguments:
 * 0: ARGS <ARRAY>
 *  0: Unit <OBJECT>
 *  1: Target <OBJECT>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, target], 20] call ace_dragging_fnc_dragObjectPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 dragObjectPFH running", ACE_time];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target"];

if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    TRACE_2("drag false",_unit,_target);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_2("dead/distance",_unit,_target);
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
