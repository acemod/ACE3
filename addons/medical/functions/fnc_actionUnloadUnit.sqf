/**
 * fn_unload_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller", "_unit","_vehicle", "_drag", "_handle"];
_caller = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_unit = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_drag = [_this, 2, false, [false]] call BIS_fnc_Param;

// cannot unload a unit not in a vehicle.
if (vehicle _unit == _unit) exitwith {};
if (([_unit] call cse_fnc_isAwake)) exitwith {};

if ([_caller, _unit] call EFUNC(common,unloadPerson_F)) then {
    if (_drag) then {
        if ((vehicle _caller) == _caller) then {
            [[_caller,_unit], QUOTE(FUNC(actionDragUnit)), _caller, false] call BIS_fnc_MP;
        };
    };
};