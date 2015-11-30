/*
 * Author: Glowbal
 * Check if caller can access targets medical equipment, based upon accessLevel.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 *
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_accessLevel", "_return"];
params ["_caller", "_target"];

_accessLevel = _target getvariable [QGVAR(allowSharedEquipmentAccess), -1];

_return = false;

if (_accessLevel >= 0) then {
    if (_accessLevel == 0) exitWith { _return = true; };
    if (_accessLevel == 1) exitWith { _return = (side _target == side _caller); };
    if (_accessLevel == 2) exitWith { _return = (group _target == group _caller); };
};

_return;
