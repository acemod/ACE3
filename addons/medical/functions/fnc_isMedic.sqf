/*
 * Author: Glowbal
 * Check if a unit is any medical class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> <OPTIONAL>
 *
 * ReturnValue:
 * Is in of medic class <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit","_class","_return"];
_unit = _this select 0;
_medicN = if (count _this > 1) then {_this select 1} else {1};

_return = false;
if (GVAR(medicSetting) >= 1) then {
    _class = _unit getvariable [QGVAR(medicClass), 0];
    if (GVAR(medicSetting) == 1) then {
        _return = _class > 0;
    } else {
        if (_class >= _medicN) then {
            _return = true;
        };
    };
} else {
    _return = true;
};

_return;
