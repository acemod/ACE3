// by commy2
#include "script_component.hpp"

private ["_vehicle", "_projectile", "_zeroing", "_position", "_subMunition"];

_vehicle = _this select 0 select 0;
_projectile = _this select 0 select 1;
_zeroing = _this select 0 select 2;

if (isNull _projectile || {!alive _projectile}) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

if (_projectile distance _vehicle < _zeroing) exitWith {};

_position = getPosATL _projectile;

_subMunition = createVehicle ["ACE_B_35mm_ABM_Helper", _position, [], 0, "FLY"];
_subMunition setPosATL _position;
_subMunition setVelocity [0, 0, -10];

deleteVehicle _projectile;

[_this select 1] call CBA_fnc_removePerFrameHandler;
