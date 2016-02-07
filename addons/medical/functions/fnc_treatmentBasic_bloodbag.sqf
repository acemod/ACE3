/*
 * Author: KoffeinFlummi
 * Callback when the bloodbag treatment is complete
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

private ["_caller", "_target"];
_caller = _this select 0;
_target = _this select 1;

if (local _target) then {
    ["treatmentBasic_bloodbagLocal", [_target]] call EFUNC(common,localEvent);
} else {
    ["treatmentBasic_bloodbagLocal", _target, [_target]] call EFUNC(common,targetEvent);
};
