/*
 * Author: commy2
 *
 * PFH for Drag Object
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
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
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed OR (target moved away from carrier (weapon disasembled))
if ((!([_target] call EFUNC(common,isAlive))) || {(_unit distance _target) > 10}) then {
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
