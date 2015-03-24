// by commy2
#include "script_component.hpp"

private ["_unit", "_target", "_timeOut"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;
_timeOut = _this select 0 select 2;

// timeout. Done with lifting object. Start carrying process.
if (time > _timeOut) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    // drop if in timeout
    private "_carriedObject";
    _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

    if (!isNull _carriedObject) exitWith {
        [_unit, _carriedObject] call FUNC(dropObject);
    };

    [_unit, _target] call FUNC(carryObject);
};
