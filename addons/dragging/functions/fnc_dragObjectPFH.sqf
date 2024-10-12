#include "..\script_component.hpp"
/*
 * Author: commy2
 * PFH for dragging an object.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Unit <OBJECT>
 * - 1: Target <OBJECT>
 * - 2: Start time <NUMBER>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, cursorTarget, CBA_missionTime], _idPFH] call ace_dragging_fnc_dragObjectPFH;
 *
 * Public: No
 */

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 dragObjectPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_startTime"];

if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    TRACE_2("drag false",_unit,_target);
    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Drop if the target is destroyed
if (!alive _target) exitWith {
    TRACE_2("dead",_unit,_target);

    [_unit, _target] call FUNC(dropObject);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Drop if the target moved away from carrier (e.g. weapon disassembled)
// attachTo seems to have some kind of network delay and target can return an odd position during the first few frames,
// So wait a full second to exit if out of range (this is critical as we would otherwise detach and set it's pos to weird pos)
if (_unit distance _target > 10 && {(CBA_missionTime - _startTime) >= 1}) exitWith {
    TRACE_2("distance",_unit,_target);

    [_unit, _target] call FUNC(dropObject);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Drop static if either non-UAV crew or new UAV crew is in it (ignore saved UAV crew)
if (_target isKindOf "StaticWeapon" && {((crew _target) - (_target getVariable [QGVAR(isUAV), []])) isNotEqualTo []}) exitWith {
    TRACE_2("static weapon crewed",_unit,_target);

    [_unit, _target] call FUNC(dropObject);

    _unit setVariable [QGVAR(hint), nil];
    call EFUNC(interaction,hideMouseHint);

    _idPFH call CBA_fnc_removePerFrameHandler;
};

// Clones can die of drowning if oxygen is under 0.5, so refill their oxygen from time to time
if (_target isKindOf QGVAR(clone) && {getOxygenRemaining _target < 0.8}) then {
    _target setOxygenRemaining 1;
};
