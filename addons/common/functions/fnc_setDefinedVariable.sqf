/**
 * fn_setVariable.sqf
 * @Descr: Setvariable value
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, variableName STRING, value ANY]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_variable","_value","_global","_definedVariable"];
_unit  = _this select 0;
_variable = _this select 1;
_value = _this select 2;
_global = false;

if (count _this > 3) then {
    _global = _this select 3;
} else {
    _definedVariable = ([_variable] call FUNC(getDefinedVariableInfo));
    if (count _definedVariable > 2) then {
        _global = _definedVariable select 2;
    };
};

if (!isNil "_value") exitwith {
    _unit setvariable [_variable, _value, _global];
};
_unit setvariable [_variable, nil, _global];