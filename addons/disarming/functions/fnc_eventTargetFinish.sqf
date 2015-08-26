/*
 * Author: PabstMirror
 *
 * After FUNC(disarmDropItems) has completed, passing a possible error code.
 * Passes that error back to orginal caller.
 *
 * Arguments:
 * 0: caller <OBJECT>
 * 1: target <OBJECT>
 * 2: errorMsg <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player1, player2, "Someting fucked up"] call ace_disarming_fnc_eventTargetFinish
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target", "_errorMsg"];

if (_errorMsg != "") then {
    ACE_LOGINFO(format ["%1 - eventTargetFinish: %2", ACE_time, _this]);
    ["DisarmDebugCallback", [_caller], [_caller, _target, _errorMsg]] call EFUNC(common,targetEvent);
};
