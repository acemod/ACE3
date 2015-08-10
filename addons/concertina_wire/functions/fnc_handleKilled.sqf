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
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_wire,_killer);

private ["_distance", "_vehicle"];

if (isNull _killer) then {
    _killer = _wire getVariable ["ace_concertina_wire_lastDamager", objNull];
    if (isNull _killer) then {
        _killer = nearestObject [_wire, "car"];
    };
};
if (isNull _killer || {_killer == _wire} || {_killer == gunner (vehicle _killer)}) exitWith {};

_distance = _wire distance _killer;
if (_distance > 14 || {_distance < 2}) exitWith {}; // Fix if shooting wire

_vehicle = vehicle _killer;

[QGVAR(vehicleDamage), [_vehicle], [_wire, _vehicle]] call EFUNC(common,targetEvent);
