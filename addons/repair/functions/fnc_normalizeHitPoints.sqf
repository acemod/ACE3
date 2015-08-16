/*
 * Author: commy2
 * Used to normalize dependant hitpoints. May overwrite some global variables that are named like hitpoints or "Total" though...
 *
 * Arguments:
 * 0: A local vehicle with hitpoints. <OBJECT>
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {};

private ["_hitPoints", "_config"];

_hitPoints = [_vehicle] call EFUNC(common,getHitPoints);

_config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints";

// define global variables. Needed to parse the depends config entries. Also find dependent hitpoints.

private ["_dependentHitPoints", "_dependentHitPointScripts"];

_dependentHitPoints = [];
_dependentHitPointScripts = [];

Total = damage _vehicle;

{
    missionNamespace setVariable [_x, _vehicle getHitPointDamage _x];

    if (isText (_config >> _x >> "depends")) then {
        _dependentHitPoints pushBack _x;
        _dependentHitPointScripts pushBack compile getText (_config >> _x >> "depends");
    };

} forEach _hitPoints;

// apply normalized damage to all dependand hitpoints

{
    private "_damage";

    _damage = call (_dependentHitPointScripts select _forEachIndex);

    _vehicle setHitPointDamage [_x, _damage];

} forEach _dependentHitPoints;
