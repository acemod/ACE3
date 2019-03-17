#include "script_component.hpp"
/*
 * Author: commy2
 * Used to normalize dependant hitpoints. May overwrite some global variables that are named like hitpoints or "Total" though...
 *
 * Arguments:
 * 0: Local Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_repair_fnc_normalizeHitPoints
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_2("params",_vehicle, typeOf _vehicle);

// Can't execute all commands if the vehicle isn't local, exit if that's so
if !(local _vehicle) exitWith {ERROR_1("Vehicle Not Local %1", _vehicle);};

(getAllHitPointsDamage _vehicle) params [["_allHitPoints", []]];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints";

private _realHitPoints = [];
private _dependentHitPoints = [];
private _dependentHitPointScripts = [];

// Find dependent hitpoints
{
    if ((_x != "") && {isClass (_config >> _x)} && {!(_x in _realHitPoints)}) then {
        _realHitPoints pushBack _x;
        if (!((getText (_config >> _x >> "depends")) in ["", "0"])) then {
            _dependentHitPoints pushBack _x;
            _dependentHitPointScripts pushBack compile getText (_config >> _x >> "depends");
        };
    };
} forEach _allHitPoints;

TRACE_2("",_realHitPoints,_dependentHitPoints);

// Don't bother setting variables if no depends on vehicle:
if (_dependentHitPoints isEqualTo []) exitWith {};


// Define global variables
Total = damage _vehicle;
{
    missionNamespace setVariable [_x, _vehicle getHitPointDamage _x];
} forEach _realHitPoints;

// apply normalized damage to all dependand hitpoints
{
    private _damage = call (_dependentHitPointScripts select _forEachIndex);
    TRACE_2("setting depend hitpoint", _x, _damage);
    _vehicle setHitPointDamage [_x, _damage];
} forEach _dependentHitPoints;
