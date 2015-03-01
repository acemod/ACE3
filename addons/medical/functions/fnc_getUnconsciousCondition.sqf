/**
 * fn_getUnconsciousCondition.sqf
 * @Descr: get whatever or not a unit should be or stay unconscious
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True when the unit should be unconscious
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_return"];
_unit = _this select 0;

if (isnil QGVAR(unconsciousConditions)) then {
    GVAR(unconsciousConditions) = [];
};

_return = false;
{
    if (typeName _x == typeName {}) then {
        if (([_unit] call _x)) then {
            _return = true;
        };
    };
    if (_return) exitwith{};
}foreach GVAR(unconsciousConditions);
_return