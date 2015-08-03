/**
 * fn_getVariable.sqf
 * @Descr: Grabs a variable. If variable has not been set, attempts to use default defined value
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, variableName STRING]
 * @Return: ANY
 * @PublicAPI: true
 */

#include "script_component.hpp"

params ["_unit", "_variable"];

private "_value";

_value = _unit getvariable _variable;
if (isnil "_value") then {
    if (count _this >2) then {
        _value = _this select 2;
    } else {
        private "_definedVariable";
        _definedVariable = ([_variable] call FUNC(getDefinedVariableInfo));
        if (count _definedVariable > 1) then {
            _value = _definedVariable select 1;
        };
    };
    if (isnil "_value") then {
        _value = 0;
    };
};
_value
