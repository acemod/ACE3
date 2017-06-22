/*
 * Author: commy2
 * Carry PFH
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
 * [[player, target, 100], 20] call ace_dragging_fnc_startCarryPFH;
 *
 * Public: No
 */
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startCarryPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// handle aborting carry
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {
    TRACE_4("carry false",_unit,_target,_timeOut,CBA_missionTime);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_4("dead/distance",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// handle persons vs objects
if (_target isKindOf "CAManBase") then {
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("Start carry person",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
} else {
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("timeout",_unit,_target,_timeOut,CBA_missionTime);
        [_idPFH] call CBA_fnc_removePerFrameHandler;

        // drop if in timeout
        private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
        [_unit, _draggedObject] call FUNC(dropObject);
    };

    // wait for the unit to stand up
    if (stance _unit == "STAND") exitWith {
        TRACE_4("Start carry object",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
};
