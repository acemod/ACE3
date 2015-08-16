/*
 * Author: commy2
 * Check if the unit can replace given wheel of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing (Object)
 * 1: vehicle to repair (Object)
 * 2: Selected hitpoint (String)
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

params ["_unit", "_target", "_hitPoint", ["_wheel",false]];
TRACE_4("params",_unit,_target,_hitPoint,_wheel);
// TODO [_unit, _wheel] call EFUNC(common,claim); on start of action
//if !([_unit, _target, _hitpoint, "ReplaceWheel"] call FUNC(canRepair)) exitwith {false};

//if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

//if !([_unit, GVAR(engineerSetting_Wheel)] call FUNC(isEngineer)) exitWith {false};

// check for a near wheel
if (typeName _wheel == "OBJECT") then {
    // not near interpret as objNull
    if !(_wheel in nearestObjects [_unit, ["ACE_Wheel"], 5]) then {
        _wheel = objNull;
    };
} else {
    _wheel = objNull;

    {
        if ([_unit, _x, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {
            _wheel = _x;
        };
    } forEach nearestObjects [_unit, ["ACE_Wheel"], 5];
};

if (isNull _wheel) exitWith {false};

alive _target && {_target getHitPointDamage _hitPoint >= 1}

