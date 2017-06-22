/*
 * Author: Rocko
 *
 * Handles wire and vehicle damage
 *
 * Arguments:
 * 0: wire <OBJECT>
 * 1: killer (vehicle) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [wire, car] call ace_concertina_wire_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_wire", "_killer"];
TRACE_2("params",_wire,_killer);

if (isNull _killer) then {
    _killer = _wire getVariable [QGVAR(lastDamager), objNull];
    if (isNull _killer) then {
        private _midPoint = ((_wire selectionPosition "start") vectorAdd (_wire selectionPosition "deploy")) vectorMultiply 0.5;
        {
            if ((vectorMagnitude velocity _x) > 0) exitWith {_killer = _x};
        } forEach (nearestObjects [(_wire modelToWorld _midPoint), ["Car"], 8]);
    };
};
if (isNull _killer || {_killer == _wire} || {_killer == gunner (vehicle _killer)}) exitWith {};

private _distance = _wire distance _killer;
if (_distance > 14 || {_distance < 2}) exitWith {}; // Fix if shooting wire

private _vehicle = vehicle _killer;

[QGVAR(vehicleDamage), [_wire, _vehicle], [_vehicle]] call CBA_fnc_targetEvent;
