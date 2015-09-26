/*
 * Author: commy2
 * Set the hitpoint damage and change the structural damage acordingly, requires local vehicle.
 *
 * Arguments:
 * 0: Local Vehicle to Damage <OBJECT>
 * 1: Selected hitpoint <STRING>
 * 2: Total Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, "hitpoint", 0.5] call ace_repair_fnc_setHitPointDamage
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_vehicle", "_hitPoint", "_hitPointDamage"];
TRACE_3("params",_vehicle,_hitPoint,_hitPointDamage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {ACE_LOGERROR_1("Vehicle Not Local %1", _vehicle);};

// get all hitpoints and selections and damages
(getAllHitPointsDamage _vehicle) params ["_allHitPoints", "_alllHitPointsSelections", "_allHitPointDamages"];

// exit if the hitpoint is not valid
if !(_hitPoint in _allHitPoints) exitWith {ACE_LOGERROR_1("NOT A VALID HITPOINT: %1", _hitpoint);};

// save structural damage and sum of hitpoint damages
private ["_damageOld", "_hitPointDamageSumOld"];

_damageOld = damage _vehicle;

_hitPointDamageSumOld = 0;
_damageOnRepairedHitpoint = 0;
_hitPointsBeingCounted = 0;
{
    if ((_x != "") && {!(_x in IGNORED_HITPOINTS)} && {!isText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> _x >> "depends")}) then {
        _hitPointDamageSumOld = _hitPointDamageSumOld + (_allHitPointDamages select _forEachIndex);
        _hitPointsBeingCounted = _hitPointsBeingCounted + 1;
    };
    if (_x == _hitPoint) then {
        _damageOnRepairedHitpoint = _damageOnRepairedHitpoint + (_allHitPointDamages select _forEachIndex);
        _allHitPointDamages set [_forEachIndex, _hitPointDamage];
    };
} forEach _allHitPoints;

// calculate new strctural damage
private "_damageNew";
if (_hitPointsBeingCounted == 0) exitWith {ACE_LOGERROR("div0");};
_damageNew = (_hitPointDamageSumOld - _damageOnRepairedHitpoint) / _hitPointsBeingCounted;

if (_hitPointDamageSumOld > 0) then {
    _damageNew = _damageOld * ((_hitPointDamageSumOld - _damageOnRepairedHitpoint) / _hitPointDamageSumOld);
};

TRACE_5("damage",_hitPointDamageSumOld,_damageOnRepairedHitpoint,_hitPointsBeingCounted,_damageOld,_damageNew);

// set new structural damage value
_vehicle setDamage _damageNew;

// set the new damage for that hit point
{
    TRACE_3("setHitIndex",(_allHitPoints select _forEachIndex),_forEachIndex,_x);
    _vehicle setHitIndex [_forEachIndex, _x];
} forEach _allHitPointDamages;

// normalize hitpoints
// [_vehicle] call FUNC(normalizeHitPoints);
