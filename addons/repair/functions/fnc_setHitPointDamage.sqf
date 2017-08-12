/*
 * Author: commy2
 * Set the hitpoint damage and change the structural damage acordingly, requires local vehicle.
 * Handles the ace_repair_setVehicleHitPointDamage event.
 *
 * Arguments:
 * 0: Local Vehicle to Damage <OBJECT>
 * 1: Selected hitpoint INDEX <NUMBER>
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
TRACE_4("params",_vehicle,typeOf _vehicle,_hitPointIndex,_hitPointDamage);

private ["_damageNew", "_damageOld", "_hitPointDamageRepaired", "_hitPointDamageSumOld", "_realHitpointCount", "_selectionName"];

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {ERROR_1("Vehicle Not Local %1", _vehicle);};

// get all hitpoints and selections and damages
(getAllHitPointsDamage _vehicle) params [["_allHitPoints", []], ["_allHitPointsSelections", []], ["_allHitPointDamages", []]];

// exit if the hitpoint is not valid
if ((_hitPointIndex < 0) || {_hitPointIndex >= (count _allHitPoints)}) exitWith {ERROR_2("NOT A VALID HITPOINT: %1-%2", _hitPointIndex,_vehicle);};

// save structural damage and sum of hitpoint damages

_damageOld = damage _vehicle;

_realHitpointCount = 0;
_hitPointDamageSumOld = 0;
_hitPointDamageRepaired = 0; //positive for repairs : newSum = (oldSum - repaired)
{
    _selectionName = _allHitPointsSelections select _forEachIndex;
    //Filter out all the bad hitpoints (HitPoint="" or no selection)
    if ((!isNil {_vehicle getHit _selectionName}) && {_x != ""}) then {
        _realHitpointCount = _realHitpointCount + 1;

        if ((((toLower _x) find "glass") == -1) && {(getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> _x >> "depends")) in ["", "0"]}) then {
            _hitPointDamageSumOld = _hitPointDamageSumOld + (_allHitPointDamages select _forEachIndex);
            if (_forEachIndex == _hitPointIndex) then {
                _hitPointDamageRepaired = (_allHitPointDamages select _forEachIndex) - _hitPointDamage;
            };
        };
    };
} forEach _allHitPoints;

// calculate new structural damage
_damageNew = (_hitPointDamageSumOld - _hitPointDamageRepaired) / _realHitpointCount;

if (_hitPointDamageSumOld > 0) then {
    _damageNew = _damageOld * ((_hitPointDamageSumOld - _hitPointDamageRepaired) / _hitPointDamageSumOld);
};
TRACE_5("structuralDamage",_damageOld,_damageNew,_hitPointDamageRepaired,_hitPointDamageSumOld,_realHitpointCount);

// set new structural damage value
_vehicle setDamage _damageNew;

//Repair the hitpoint in the damages array:
_allHitPointDamages set [_hitPointIndex, _hitPointDamage];

//Set the new damage for all hitpoints
{
    _vehicle setHitIndex [_forEachIndex, _x];
} forEach _allHitPointDamages;

// normalize hitpoints
[_vehicle] call FUNC(normalizeHitPoints);
