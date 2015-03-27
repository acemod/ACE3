/*
 * Author: Glowbal
 * Check if caller can carry or drag the target
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

 private ["_caller", "_target", "_positionUnit", "_carry"];
_caller = _this select 0;
_target = _this select 1;

if (!(_target isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{false};

if (vehicle _caller != _caller || vehicle _target != _target) exitwith {false};

if (!([_caller] call EFUNC(common,canInteract)) || {_caller == _target} || {(([_target] call EFUNC(common,isAwake)))}) exitwith {false};

if (!alive _target) exitwith {GVAR(allowDeadBodyMovement)};

((isNull ([_caller] call FUNC(getCarriedObj))) && {isNull ([_target] call FUNC(getCarriedObj))} && {isNull ([_caller] call FUNC(getCarriedBy))} && {isNull ([_target] call FUNC(getCarriedBy))})
