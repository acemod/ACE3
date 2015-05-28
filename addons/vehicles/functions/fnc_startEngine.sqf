// by commy2
#include "script_component.hpp"

private ["_vehicle", "_isEngineOn"];

_vehicle = _this select 0;
_isEngineOn = _this select 1;

if (!_isEngineOn || {floor abs speed _vehicle > 0}) exitWith {};

[{
    private ["_vehicle", "_time", "_direction"];

    _vehicle = _this select 0 select 0;
    _time = _this select 0 select 1;
    _direction = _this select 0 select 2;

    if (ACE_time > _time) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    _vehicle setVelocity [0, 0, 0];
    _vehicle setVectorDirAndUp _direction;

} , 0, [_vehicle, ACE_time + STARTUP_DELAY, [vectorDir _vehicle, vectorUp _vehicle]]] call CBA_fnc_addPerFrameHandler;
