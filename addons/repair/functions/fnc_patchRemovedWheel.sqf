#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Patch a wheel that is not on a vehicle
 *
 * Arguments:
 * 0: Unit that does the patching <OBJECT>
 * 1: Wheel to patch <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle] call ace_repair_fnc_patchRemovedWheel
 *
 * Public: No
 */

params ["_unit", "_target"];

[_unit, "Acts_carFixingWheel"] call EFUNC(common,doAnimation);

private _wheelDamage = (damage _target) - GVAR(patchWheelMaximumRepair);

[ceil (_wheelDamage / 0.05) * GVAR(patchWheelTime), [_target], {}, {}, LLSTRING(PatchingWheel), {
    params ["_args"];
    _args params ["_target"];
    private _damage = damage _target;

    private _iterationsRemaining = ceil ((_damage - GVAR(patchWheelMaximumRepair)) / 0.05) - 1;
    if ((_totalTime - _elapsedTime) > _iterationsRemaining * GVAR(patchWheelTime)) exitWith {true};

    _damage = _damage - 0.05;

    if (_damage < GVAR(patchWheelMaximumRepair)) then {
        _damage = GVAR(patchWheelMaximumRepair);
    };

    _target setDamage _damage;

    _damage > GVAR(patchWheelMaximumRepair)
}] call ace_common_fnc_progressBar;

