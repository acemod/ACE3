#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * After FUNC(disarmDropItems) has completed, passing a possible error code.
 * Passes that error back to orginal caller.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 * 2: Error message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "Something fucked up"] call ace_disarming_fnc_eventTargetFinish
 *
 * Public: No
 */

params ["_caller", "_target", "_errorMsg"];

if (_errorMsg != "") then {
    INFO_2("%1 - eventTargetFinish: %2",CBA_missionTime,_this);
    [QGVAR(debugCallback), [_caller, _target, _errorMsg], _caller] call CBA_fnc_targetEvent;
};
