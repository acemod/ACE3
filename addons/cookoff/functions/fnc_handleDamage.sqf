/*
 * Author: KoffeinFlummi, commy2
 * Handles all incoming damage for tanks (including wheeled APCs).
 *
 * Arguments:
 * HandleDamage EH
 *
 * Return Value:
 * Damage to be inflicted.
 *
 * Example:
 * _this call ace_cookoff_fnc_handleDamage
 *
 * Public: No
 * PROPOSED EDIT BY DLEGION :
 * please be patient i'm a poor noob about code, i hardly understand it,
 * and there are sure better ways to get the same/better results,
 * i just do my best to get the desired results, and all the changes i will submit are tested,
 * and to my knowledge they work good with no problems / bugs.
 * thanks for your time spent on my suggestions.
 * COOKOFF SPEFIC EDIT INFO:
 * the problem with 3.7.0 version: Leopard AAF tank seems to be unkillable (not exploding) by Comanche DAGR and cannon,
 * by kajman AG missiles and cannon, and with titan AT rockets sometimes blow up with 1 hit, sometimes need 4 hits.
 * the solution : as temporary fix i found that changing some numbers and removing a couple of lines, 
 * now the Comanche DAGR and cannon, kajman AG missiles and 30mm cannon with AP rounds (and only AP rounds, HE don't harm it)
 * shot in the turret destroy the tank by cooking it off as they should. 
 * titan too seems to works correctly. only from some angles it dont kill it in 1 shot, but that's ok for me! 
 */
#include "script_component.hpp"

params ["_simulationType", "_thisHandleDamage"];
_thisHandleDamage params ["_vehicle", "", "_damage", "", "_ammo", "_hitIndex"];

// it's already dead, who cares?
if (damage _vehicle >= 1) exitWith {};

// get hitpoint name
private _hitpoint = "#structural";

if (_hitIndex != -1) then {
    _hitpoint = toLower ((getAllHitPointsDamage _vehicle param [0, []]) select _hitIndex);
};

// get change in damage
private "_oldDamage";

if (_hitpoint isEqualTo "#structural") then {
    _oldDamage = damage _vehicle;
} else {
    _oldDamage = _vehicle getHitIndex _hitIndex;
};

private _newDamage = _damage - _oldDamage;

// handle different types of vehicles
// note: exitWith only works here, because this is not the main scope of handleDamage
// you cannot use the return value together with exitWith in the main scope, it's a bug
// also, we add this event handler with the addEventHandler SQF command,
// because the config version ignores the return value completely
if (_simulationType == "car") exitWith {
    // prevent destruction, let cook-off handle it if necessary
    if (_hitpoint in ["hithull", "hitfuel", "#structural"] && {!IS_EXPLOSIVE_AMMO(_ammo)}) then {
        _damage min 0.89
    } else {
        if (_hitpoint isEqualTo "hitengine" && {_damage > 0.8}) then {
            _vehicle call FUNC(engineFire);
        };
        _damage
    };
};

if (_simulationType == "tank") exitWith {
    // determine ammo storage location
    private _ammoLocationHitpoint = getText (_vehicle  call CBA_fnc_getObjectConfig >> QGVAR(ammoLocation));

    // ammo was hit, high chance for cook-off
    if (_hitpoint == _ammoLocationHitpoint) then {
        if (_damage > 0.5 && {random 1 < 1.7}) then {
            _vehicle call FUNC(cookOff);
        };
    } else {
        if (_hitpoint in ["hitbody", "hitturret", "#structural"] && {_newDamage > 0.5 + random 0.3}) then {
            _vehicle call FUNC(cookOff);
        };
    };

    // prevent destruction, let cook-off handle it if necessary
    if (_hitpoint in ["hithull", "hitfuel", "#structural"]) then {
        _damage min 0.89
    } else {
        _damage
    };
};
