/**
 * fn_setCanInteract.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_to","_return"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_to = _this select 1;
_return = false;

if (((typeName _to) == "SCALAR")) then {
    if (_to <-1) then {
        _to = -1;
    } else {
        if (_to > 1) then {
            _to = 1;
        };
    };
    _unit setvariable [QGVAR(canInteract), ([_unit] call FUNC(getCanInteract)) + _to,false];
    _return = true;
};
_return