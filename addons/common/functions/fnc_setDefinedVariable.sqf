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

private ["_global","_definedVariable"];

PARAMS_3(_unit,_variable,_value);

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