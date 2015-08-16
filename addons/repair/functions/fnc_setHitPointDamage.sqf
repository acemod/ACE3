/*
 * Author: commy2
 * Set the hitpoint damage and change the structural damage acordingly. Requires local vehicle.
 *
 * Arguments:
 * 0: vehicle
 * 1: hitpoint
 * 2: damage
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

params ["_vehicle", "_hitPoint", "_hitPointDamage"];
TRACE_3("params",_vehicle,_hitPoint,_hitPointDamage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {};

// get all valid hitpoints
private ["_hitPoints", "_hitPointsWithSelections"];

_hitPoints = [_vehicle] call EFUNC(common,getHitpoints);
_hitPointsWithSelections = [_vehicle] call EFUNC(common,getHitpointsWithSelections) select 0;

// exit if the hitpoint is not valid
if !(_hitPoint in _hitPoints) exitWith {systemChat format["NOT A VALID HITPOINT: %1",_hitpoint]};

// save array with damage values of all hitpoints
private "_hitPointDamages";
_hitPointDamages = [];

{
    _hitPointDamages set [_forEachIndex, (_vehicle getHitPointDamage _x)];
} forEach _hitPoints;

// save structural damage and sum of hitpoint damages
private ["_damageOld", "_hitPointDamageSumOld"];

_damageOld = damage _vehicle;

_hitPointDamageSumOld = 0;
{
    if (!(_x in IGNORED_HITPOINTS) && {!isText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> _x >> "depends")}) then {
        _hitPointDamageSumOld = _hitPointDamageSumOld + (_hitPointDamages select (_hitPoints find _x));
    };
} forEach _hitPointsWithSelections;

// set new damage in array
_hitPointDamages set [_hitPoints find _hitPoint, _hitPointDamage];

// save sum of new hitpoint damages
private "_hitPointDamageSumNew";

_hitPointDamageSumNew = 0;
{
    if (!(_x in IGNORED_HITPOINTS) && {!isText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> _x >> "depends")}) then {
        _hitPointDamageSumNew = _hitPointDamageSumNew + (_hitPointDamages select (_hitPoints find _x));
    };
} forEach _hitPointsWithSelections;

// calculate new strctural damage
private "_damageNew";
_damageNew = _hitPointDamageSumNew / count _hitPoints;

if (_hitPointDamageSumOld > 0) then {
    _damageNew = _damageOld * (_hitPointDamageSumNew / _hitPointDamageSumOld);
};

// set new structural damage value
_vehicle setDamage _damageNew;

// set the new damage for that hit point

{
    _vehicle setHitPointDamage [_x, _hitPointDamages select _forEachIndex];
} forEach _hitPoints;

// normalize hitpoints
// [_vehicle] call FUNC(normalizeHitPoints);
