#include "script_component.hpp"
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

params ["_vehicle", "_damage"];
TRACE_2("params",_vehicle,_damage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {};

// save array with damage values of all hitpoints
(getAllHitPointsDamage _vehicle) params [["_allHitPoints", []], ["_allHitPointsSelections", []], ["_allHitPointDamages", []]];

// set damage of the vehicle
private _damageDisabled = !isDamageAllowed _vehicle;
if (_damageDisabled) then {
    _vehicle allowDamage true;
};

_vehicle setDamage _damage;

// restore original hitpoint damage values
{
    _vehicle setHitIndex [_forEachIndex, _x];
} forEach _allHitPointDamages;

// normalize hitpoints
[_vehicle] call FUNC(normalizeHitPoints);

if (_damageDisabled) then {
    _vehicle allowDamage false;
};
