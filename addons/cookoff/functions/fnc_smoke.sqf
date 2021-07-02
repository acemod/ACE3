#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Starts vehicle barrel smoke effect.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1. Selections for smoke to come out of <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, ["commander_turret"]] call ace_cookoff_fnc_barrelSmoke
 *
 * Public: No
 */

params ["_vehicle", ["_positions", []]];
 
private _turretConfig = [_vehicle, [0]] call CBA_fnc_getTurret;
private _positionBarrelEnd = getText (_turretConfig >> "gunBeg");

// smoke out of cannon and hatches
private _smokeBarrel = "#particlesource" createVehicleLocal [0, 0, 0];
_smokeBarrel setParticleClass "MediumDestructionSmoke";
_smokeBarrel attachTo [_vehicle, [0, 0, 0], _positionBarrelEnd];

private _effects = [_smokeBarrel];

{
    private _position = [0, -2, 0];

    if !(_x isEqualTo "#noselection") then {
        _position = _vehicle selectionPosition _x;
    };

    private _smoke = "#particlesource" createVehicleLocal [0, 0, 0];
    _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
    _smoke attachTo [_vehicle, _position];

    _effects pushBack _smoke;
} forEach _positions;

_vehicle setVariable [QGVAR(effects), _effects];
