/**
 * fn_getAllSetVariables.sqf
 * @Descr: Returns an 2d array of all variables that have been set on the object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, category STRING (Optional. Only get the variables from the specified category. Default is "" == all)]
 * @Return: ARRAY REturns an array with the format  [ [name STRING, typeName STRING, value ANY, publicFlag BOOL, peristentFlag BOOL] ]
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_return", "_val"];
params ["_object", ["_category", ""]];

if (isnil QGVAR(OBJECT_VARIABLES_STORAGE)) exitwith {
    [];
};

_return = [];
{
    _val = _object getvariable (_x select 0);
    if (!isnil "_val") then {
        if (_category == "" || _category == _x select 3) then {
            _return pushback [_x select 0, typeName _val, _val, _x select 2, _x select 5];
        };
    };
}foreach GVAR(OBJECT_VARIABLES_STORAGE);
_return