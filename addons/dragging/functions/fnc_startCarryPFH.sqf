// by commy2
#include "script_component.hpp"

private ["_unit", "_target", "_timeOut"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;
_timeOut = _this select 0 select 2;

// handle aborting carry
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// same as dragObjectPFH, checks if object is deleted or dead.
if !([_target] call EFUNC(common,isAlive)) then {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// timeout. Done with lifting object. Start carrying process.
if (time > _timeOut) exitWith {
    [_unit, _target] call FUNC(carryObject);

    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// @todo, wait for stance _unit == "STAND"
