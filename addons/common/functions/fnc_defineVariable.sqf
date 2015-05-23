/**
 * fn_defineVariable.sqf
 * @Descr: Define a variable for the ACE variable framework
 * @Author: Glowbal
 *
 * @Arguments: [name STRING, defaultValue ANY, publicFlag BOOL, category STRING, type NUMBER, persistentFlag BOOL]
 * @Return:
 * @PublicAPI: true
 */
#include "script_component.hpp"

private ["_code","_persistent"];

PARAMS_4(_name,_value,_defaultGlobal,_catagory);

_code = 0;
_persistent = false;

if (count _this < 3) exitwith {};
if (count _this > 4) then {
    _code = _this select 4;
    if (count _this > 5) then {
        _persistent = _this select 5;
    };
};

if (typeName _name != typeName "") exitwith {
    [format["Tried to the deinfe a variable with an invalid name: %1 Arguments: %2", _name, _this]] call FUNC(debug);
};

if (isnil QGVAR(OBJECT_VARIABLES_STORAGE)) then {
    GVAR(OBJECT_VARIABLES_STORAGE) = [];
};

GVAR(OBJECT_VARIABLES_STORAGE) pushback [_name,_value,_defaultGlobal,_catagory,_code, _persistent];

missionNamespace setvariable [QGVAR(OBJECT_VARIABLES_STORAGE_) + _name, [_name,_value,_defaultGlobal,_catagory,_code, _persistent]];

