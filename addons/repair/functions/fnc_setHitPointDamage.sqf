/*
 * Author: commy2
 * Set the hitpoint damage and change the structural damage acordingly, requires local vehicle.
 * Handles the "setVehicleHitPointDamage" event
 *
 * Arguments:
 * 0: Local Vehicle to Damage <OBJECT>
 * 1: Selected hitpointIndex <NUMBER>
 * 2: Total Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 1, 0.5] call ace_repair_fnc_setHitPointDamage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_hitPointIndex", "_hitPointDamage"];
TRACE_3("params",_vehicle,_hitPointIndex,_hitPointDamage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {ACE_LOGERROR_1("Vehicle Not Local %1", _vehicle);};

// get all hitpoints and selections and damages
(getAllHitPointsDamage _vehicle) params [["_allHitPoints", []], ["_allHitPointsSelections", []], ["_allHitPointDamages", []]];

if ((typeName _hitPointIndex) == "STRING") then {
    ACE_LOGWARNING_1("setHitpointDamage - _hitPointIndex was string %1", _this);
    _hitPointIndex = _allHitPoints find _hitPointIndex;
};

// exit if the hitpoint is not valid
if ((_hitPointIndex < 0) || {_hitPointIndex >= (count _allHitPoints)}) exitWith {ACE_LOGERROR_2("NOT A VALID HITPOINT: %1-%2", _hitPointIndex,_vehicle);};

// save structural damage and sum of hitpoint damages
private ["_damageOld", "_hitPointIndexDamageSumOld", "_damageRepaired", "_hitPointIndexsBeingCounted", "_selectionName", "_damageNew"];

_damageOld = damage _vehicle;

_damageRepaired = 0;
_hitPointIndexDamageSumOld = 0;
_hitPointIndexsBeingCounted = 0;
{
    _selectionName = _allHitPointsSelections select _forEachIndex;
    if ((!isNil {_vehicle getHit _selectionName}) && {_x != ""}) then {
        if ((!(_x in IGNORED_HITPOINTS)) && {!isText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> _x >> "depends")}) then {
            _hitPointIndexDamageSumOld = _hitPointIndexDamageSumOld + (_allHitPointDamages select _forEachIndex);
            _hitPointIndexsBeingCounted = _hitPointIndexsBeingCounted + 1;
            if (_forEachIndex == _hitPointIndex) then {
                _damageRepaired = ((_allHitPointDamages select _forEachIndex) - _hitPointDamage);
            };
        };
    };
} forEach _allHitPoints;

// calculate new strctural damage
_damageNew = if (_hitPointIndexsBeingCounted == 0) then {
    ACE_LOGERROR("Zero hitPointIndexsBeingCounted  (div0)");
    _damageOld
} else {
    (_hitPointIndexDamageSumOld - _damageRepaired) / _hitPointIndexsBeingCounted;
};
if (_hitPointIndexDamageSumOld > 0) then {
    _damageNew = _damageOld * ((_hitPointIndexDamageSumOld - _damageRepaired) / _hitPointIndexDamageSumOld);
};

TRACE_5("damage",_damageRepaired,_hitPointIndexDamageSumOld,_hitPointIndexsBeingCounted,_damageOld,_damageNew);

// set new structural damage value
_vehicle setDamage _damageNew;

_allHitPointDamages set [_hitPointIndex, _hitPointDamage];
// set the new damage for that hit point
{
    _vehicle setHitIndex [_forEachIndex, _x];
} forEach _allHitPointDamages;

// normalize hitpoints
// [_vehicle] call FUNC(normalizeHitPoints);
