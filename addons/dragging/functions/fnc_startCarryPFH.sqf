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

// Drop if the target is destroyed, if the target moved away from carrier (e.g. weapon disassembled) or if the carrier starts limping
if !(alive _target && {_unit distance _target <= 10} && {_unit getHitPointDamage "HitLegs" < 0.5}) exitWith {
    TRACE_4("dead/distance/limping",_unit,_target,_timeOut,CBA_missionTime);
    [_unit, _target] call FUNC(dropObject_carry);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Handle persons vs. objects
if (_target isKindOf "CAManBase") then {
    // Carry person after timeout (animation takes a long time to finish)
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("Start carry person",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        _idPFH call CBA_fnc_removePerFrameHandler;
    };
} else {
    // Timeout: Drop target. CBA_missionTime, because anim length is linked to ingame time
    if (CBA_missionTime > _timeOut) exitWith {
        TRACE_4("timeout",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(dropObject_carry);

        _idPFH call CBA_fnc_removePerFrameHandler;
    };

    // Wait for the unit to stand up
    if (stance _unit == "STAND") exitWith {
        TRACE_4("Start carry object",_unit,_target,_timeOut,CBA_missionTime);
        [_unit, _target] call FUNC(carryObject);

        _idPFH call CBA_fnc_removePerFrameHandler;
    };
};
