/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment is completed
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target","_selectionName","_className","_config","_callback"];
_args = _this select 0;
_caller = _args select 0;
_target = _args select 1;
_selectionName = _args select 2;
_className = _args select 3;

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
};
[_caller, _caller getvariable [QGVAR(treatmentPrevAnimCaller), ""], 1] call EFUNC(common,doAnimation);
_caller setvariable [QGVAR(treatmentPrevAnimCaller), nil];

// Record specific callback
_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};

_callback = getText (_config >> "callbackSuccess");
if (isNil _callback) then {
    _callback = compile _callback;
} else {
    _callback = missionNamespace getvariable _callback;
};

_args call _callback;

[_target, _className] call FUNC(createLitter);
