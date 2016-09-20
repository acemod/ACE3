/*
 * Author: esteldunedain
 * Associates a newly created laser target to it's owner
 *
 * Argument:
 * 0: _targetObject <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_targetObject"];

// Only handle locally created lasers
if(!(local _targetObject)) exitWith { };

private _owners = allUnits select {(lasertarget _x) == _targetObject};
if (count _owners == 1) exitWith {
    TRACE_2("Laser target owner", _targetObject, _owners select 0);
    [_targetObject, _owners select 0] call FUNC(addLaserTarget);
};

_owners = allUnitsUAV select {(lasertarget _x) == _targetObject};
if (count _owners == 1) exitWith {
    TRACE_2("Laser target owner", _targetObject, _owners select 0);
    [_targetObject, _owners select 0] call FUNC(addLaserTarget);
};

TRACE_1("Laser target doesn't have owner", _targetObject);
