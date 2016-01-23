/*
 * Author: commy2
 * Sets the structural damage of a vehicle without altering the hitPoints, requires local vehicle.
 *
 * Arguments:
 * 0: Local Vehicle to Damage <OBJECT>
 * 1: Total Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 0.5] call ace_repair_fnc_setDamage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_damage"];
TRACE_2("params",_vehicle,_damage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {};

// save array with damage values of all hitpoints
private ["_hitPoints", "_hitPointDamages"];

_hitPoints = [_vehicle] call EFUNC(common,getHitpoints);

_hitPointDamages = [];

{
    _hitPointDamages set [_forEachIndex, _vehicle getHitPointDamage _x];
} forEach _hitPoints;

// set damage of the vehicle
_vehicle setDamage _damage;

// restore original hitpoint damage values
{
    _vehicle setHitPointDamage [_x, _hitPointDamages select _forEachIndex];
} forEach _hitPoints;

// normalize hitpoints
[_vehicle] call FUNC(normalizeHitPoints);
