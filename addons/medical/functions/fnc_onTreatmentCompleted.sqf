/*
 * Author: Glowbal
 * Callback when the treatment is completed
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: completed <BOOL>
 *
 * Return Value:
 * nil
 *
 * Public: false
 */

#include "script_component.hpp"

private ["_caller", "_target","_selectionName","_className", "_completed"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_completed = _this select 4;

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
    [_caller, _caller getvariable [QGVAR(treatmentPrevAnimCaller), ""]] call EFUNC(common,doAnimation);
    _caller setvariable [QGVAR(treatmentPrevAnimCaller), nil];
};
