/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment fails
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target","_selectionName","_className","_config","_callback"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
    [_caller, _caller getvariable [QGVAR(treatmentPrevAnimCaller), ""]] call EFUNC(common,doAnimation);
    _caller setvariable [QGVAR(treatmentPrevAnimCaller), nil];
};


// Record specific callback
_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 1) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};

_callback = getText (_config >> "callbackFailure");

_this call compile _callback
