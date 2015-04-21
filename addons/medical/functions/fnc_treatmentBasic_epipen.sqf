/*
 * Author: KoffeinFlummi
 * Callback when the epipen treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target","_className"];
_caller = _this select 0;
_target = _this select 1;
_className = _this select 3;

[_target, false] call FUNC(setUnconscious);

if (_target getvariable [QGVAR(inReviveState), false]) then {
    _target setvariable [QGVAR(inReviveState), nil, true];
};
