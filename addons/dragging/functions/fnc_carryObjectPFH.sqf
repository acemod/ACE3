#include "script_component.hpp"
/*
 * Author: commy2
 * PFH for Carry Object
 *
 * Arguments:
 * 0: ARGS <ARRAY>
 *  0: Unit <OBJECT>
 *  1: Target <OBJECT>
 *  2: Start time <NUMBER>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, target], 20] call ace_dragging_fnc_carryObjectPFH;
 *
 * Public: No
 */

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 carryObjectPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_startTime"];

if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {
    TRACE_2("carry false",_unit,_target);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// Update mouse hint
private _ctrlTextLMB = (uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420;
if (
    !isNull cursorObject
    && {([ACE_player, cursorObject, ["isNotCarrying"]] call EFUNC(common,canInteractWith))}
    && {
        if (_target isKindOf "CAManBase") then {
            ([] isNotEqualTo ([cursorObject, 0, true] call EFUNC(common,nearestVehiclesFreeSeat)))
            && {([_target, cursorObject] call EFUNC(interaction,getInteractionDistance)) < MAX_LOAD_DISTANCE}
        } else {
            [_target, cursorObject] call EFUNC(cargo,canLoadItemIn)
        }
    }
) then {
    _ctrlTextLMB ctrlSetText localize ELSTRING(Cargo,loadObject);
} else {
    _ctrlTextLMB ctrlSetText localize LSTRING(Drop);
};

// drop if the crate is destroyed OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    TRACE_2("dead/distance",_unit,_target);
    if ((_unit distance _target > 10) && {(CBA_missionTime - _startTime) < 1}) exitWith {
        //attachTo seems to have some kind of network delay and target can return an odd position during the first few frames,
        //so wait a full second to exit if out of range (this is critical as we would otherwise detach and set it's pos to weird pos)
        TRACE_3("ignoring bad distance at start",_unit distance _target,_startTime,CBA_missionTime);
    };
    [_unit, _target] call FUNC(dropObject_carry);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
