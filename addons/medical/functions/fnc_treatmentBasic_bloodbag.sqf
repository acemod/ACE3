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
#define BLOODBAGHEAL 70

private ["_caller", "_target","_className","_blood"];
_caller = _this select 0;
_target = _this select 1;
_className = _this select 3;

_blood = ((_target getVariable [QGVAR(bloodVolume), 100]) + BLOODBAGHEAL) min 100;
_target setVariable [QGVAR(bloodVolume), _blood, true];
