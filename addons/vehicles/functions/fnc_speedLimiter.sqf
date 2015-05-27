// by commy2
#include "script_component.hpp"

private ["_driver", "_vehicle"];

_driver = _this select 0;
_vehicle = _this select 1;

if (GETGVAR(isSpeedLimiter,false)) exitWith {
    [localize STRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    GVAR(isSpeedLimiter) = false;
};

[localize STRING(On)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;

private "_maxSpeed";
_maxSpeed = speed _vehicle max 10;

[{
    private ["_driver", "_vehicle", "_maxSpeed"];

    _driver = _this select 0 select 0;
    _vehicle = _this select 0 select 1;
    _maxSpeed = _this select 0 select 2;

    if (!GVAR(isSpeedLimiter) || {_driver != driver _vehicle}) exitWith {
        GVAR(isSpeedLimiter) = false;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    private "_speed";
    _speed = speed _vehicle;

    if (_speed > _maxSpeed) then {
        _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((_maxSpeed / _speed) - 0.00001));  // fix 1.42-hotfix PhysX libraries applying force in previous direction when turning
    };

} , 0, [_driver, _vehicle, _maxSpeed]] call CBA_fnc_addPerFrameHandler;
