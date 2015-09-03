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

private ["_target", "_caller", "_accessLevel", "_return"];
_caller = _this select 0;
_target = _this select 1;

_accessLevel = _target getvariable [QGVAR(allowSharedEquipmentAccess), -1];

_return = false;

if (_accessLevel >= 0) then {
    if (_accessLevel == 0) exitwith { _return = true; };
    if (_accessLevel == 1) exitwith { _return = (side _target == side _caller); };
    if (_accessLevel == 2) exitwith { _return = (group _target == group _caller); };
};

_return;