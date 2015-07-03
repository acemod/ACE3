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

private ["_caller", "_target", "_treatmentClassname"];
_caller = _this select 0;
_target = _this select 1;
_treatmentClassname = _this select 3;

[[_target, _treatmentClassname], QUOTE(DFUNC(treatmentBasic_bloodbagLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
