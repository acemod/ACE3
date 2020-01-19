#include "script_component.hpp"
/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with checkVisibility
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target <OBJECT>
 * 2: Whether or not to use checkVisibility to test for LOS <BOOLEAN>
 *
 * Return Value:
 * Has LOS <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_missileguidance_fnc_checkLOS;
 *
 * Public: No
 */

params ["_projectile", "_miscFuze"];
_miscFuze params ["_fuzeVehicle", "_fuzeAlt", "_fuzeRange", "_fuzeTime", "_fuzeLoc"];

private _projPos = getPosASL _projectile;

_fuzeVehicle params ["_fuzeVehicleRadius", "_armedFuzeVehicle", "_nearestPass"];
_fuzeAlt params ["_fuzeAltHeight", "_armedFuzeAlt"];
_fuzeRange params ["_fuzeRangeDistance", "_armedFuzeRange", "_distanceTraveled"];
_fuzeTime params ["_fuzeTime", "_armedFuzeTime", "_timeRun"];
_fuzeLoc params ["_fuzeLocDistance", "_armedFuzeLoc", "_fuzeLocPos"];

private _return = false;

if (_armedFuzeVehicle) then {
    _vehs = (_projPos) nearObjects ["AllVehicles", _fuzeVehicleRadius];
    if(count _vehs > 0) then {
        if( ((_projectile distance (_vehs select 0)) > _nearestPass) && (_nearestPass > 0) ) exitWith {
            triggerAmmo _projectile;
            _return = true;
        };
        _fuzeVehicle set [2, (_projectile) distance (_vehs select 0)];
    };
};

if (_armedFuzeAlt) then {
    if(ASLToAGL(_projPos) select 2 < _fuzeAltHeight) exitWith {
    triggerAmmo _projectile;
    _return = true;
    };
};

if (_armedFuzeRange) then {
    if((_distanceTraveled > _fuzeRangeDistance) && (_fuzeRangeDistance > 0)) exitWith {
    triggerAmmo _projectile;
    _return = true;
    };
};

if (_armedFuzeTime) then {
    if(_timeRun > _fuzeTime) exitWith {
        triggerAmmo _projectile;
        _return = true;
    };
};

if (_armedFuzeLoc) then {
    if((_fuzeLocDistance > (_fuzeLocPos distance _projPos))) exitWith {
        triggerAmmo _projectile;
        _return = true;
    };
};


_return;
