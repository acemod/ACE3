#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks for carrying conditions. If these are met, the unit will start carrying. Called from ace_dragging_fnc_startCarry.
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
 * [[player, cursorTarget, 10], _idPFH] call ace_dragging_fnc_startCarryPFH;
 *
 * Public: No
 */

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 startCarryPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_timeOut"];

// Handle aborting carry
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {
    TRACE_4("carry false",_unit,_target,_timeOut,CBA_missionTime);
    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Same as dragObjectPFH, checks if object is deleted or dead OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_4("dead/distance",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject_carry);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Handle persons vs. objects
if (_target isKindOf "CAManBase") then {
    // Drop if in timeout
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("Start carry person",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        _idPFH call CBA_fnc_removePerFrameHandler;
    };
} else {
    // Drop if in timeout
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("timeout",_unit,_target,_timeOut,CBA_missionTime);
        _idPFH call CBA_fnc_removePerFrameHandler;

        private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];
        [_unit, _draggedObject] call FUNC(dropObject_carry);
    };

    // Wait for the unit to stand up
    if (stance _unit == "STAND") exitWith {
        TRACE_4("Start carry object",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        _idPFH call CBA_fnc_removePerFrameHandler;
    };
};
