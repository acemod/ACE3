/**
 * fn_load_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"


private ["_caller", "_unit","_vehicle", "_loaded"];
_caller = _this select 0;
_unit = _this select 1;

if ([_unit] call cse_fnc_isAwake) exitwith {
    hintSilent "This person is awake and cannot be loaded";
};

[_caller,objNull] call cse_fnc_carryObj;
[_unit,objNull] call cse_fnc_carryObj;

_vehicle = [_caller, _unit] call EFUNC(common,loadPerson);
if (!isNull _vehicle) then {
    if (!isnil QGVAR(DROP_ADDACTION)) then {
        _caller removeAction GVAR(DROP_ADDACTION);
        GVAR(DROP_ADDACTION) = nil;
    };
};