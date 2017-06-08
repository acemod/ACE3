/*
 * Author: esteldunedain
 * Associates a newly created laser target to it's owner
 *
 * Argument:
 * 0: Vanilla Laser (base type LaserTarget) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [laserTarget player] call ace_laser_fnc_handleLaserTargetCreation;
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("params",_this);
[{
    params ["_targetObject"];

    // Only handle locally created lasers
    if(!(local _targetObject)) exitWith {TRACE_1("not local",_targetObject);};

    private _owners = allUnits select {(lasertarget _x) == _targetObject};
    if (count _owners == 1) exitWith {
        TRACE_2("Laser target owner [allUnits]", _targetObject, _owners select 0);
        [_targetObject, _owners select 0] call FUNC(addLaserTarget);
    };

    _owners = vehicles select {(lasertarget _x) == _targetObject};
    if (count _owners == 1) exitWith {
        TRACE_2("Laser target owner [vehicles]", _targetObject, _owners select 0);
        [_targetObject, _owners select 0] call FUNC(addLaserTarget);
    };

    TRACE_1("Laser target doesn't have owner", _targetObject);
}, _this] call CBA_fnc_execNextFrame;
