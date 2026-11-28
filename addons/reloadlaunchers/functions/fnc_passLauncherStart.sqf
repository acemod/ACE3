#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Start passing launcher to target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, player] call ace_reloadlaunchers_fnc_passLauncherStart
 *
 * Public: No
 */

[2.5, _this, {
    // Finish
    (_this # 0) params ["_target", "_player"];
    private _array = (getUnitLoadout _player) select 1;
    TRACE_3("passing",_target,_player,_array);
    _player removeWeapon (_array # 0);
    [QGVAR(passLauncher), [_target, _array], _target] call CBA_fnc_targetEvent;
}, { 
    // Failure
    TRACE_1("passLauncherFailed",_this);
}, LLSTRING(LoadingLauncher), {
    // Condition check 
    (_this # 0) call FUNC(passLauncherCondition);
}, ["isNotInside", "isNotSwimming"]] call EFUNC(common,progressBar);
