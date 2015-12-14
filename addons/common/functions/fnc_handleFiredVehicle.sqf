/*
 * Author: commy2
 *
 * Calls different scripted fired eventhandlers to reduce number of sanity checks, calls of specific functions, etc.
 * Arguments are passed as _this select 0, additional arguments are passed as _this select 1.
 * Additional arguments:
 *  _this select 1 select 0: the gunner
 *  _this select 1 select 1: turret index that fired
 *
 * Argument:
 * Stuff from fired eh.
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

private ["_vehicle", "_weapon"];

_vehicle = _this select 0;
_weapon = _this select 1;

private ["_gunner", "_turret"];

_gunner = objNull;
_turret = [];

{
    if (_weapon in (_vehicle weaponsTurret _x)) exitWith {
        _gunner = _vehicle turretUnit _x;
        _turret = _x;
    };
} forEach allTurrets [_vehicle, true];

// gunner not in any turret -> must be the vehicles designated gunner
if (isNull _gunner) then {
    _gunner = gunner _vehicle;
};

// @todo handle
//if (isManualFire _vehicle)
//

if (local _gunner) then {
    ["firedVehicle", [_this, [_gunner, _turret]]] call FUNC(localEvent);
};

if (local _gunner) then {
    ["firedVehicleLocal", [_this, [_gunner, _turret]]] call FUNC(localEvent);

    if (_gunner == ACE_player) then {
        ["firedVehiclePlayer", [_this, [_gunner, _turret]]] call FUNC(localEvent);
    };
};
