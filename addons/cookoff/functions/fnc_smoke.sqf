#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Starts vehicle barrel smoke effect.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Selections for smoke to come out of <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, ["commander_turret"]] call ace_cookoff_fnc_smoke
 *
 * Public: No
 */

params ["_vehicle", "_selections"];

private _positionBarrelEnd = getText ([_vehicle, [0]] call CBA_fnc_getTurret >> "gunBeg");

// Smoke out of cannon and hatches
private _smokeBarrel = "#particlesource" createVehicleLocal [0, 0, 0];
_smokeBarrel setParticleClass "MediumDestructionSmoke";
_smokeBarrel attachTo [_vehicle, [0, 0, 0], _positionBarrelEnd];

private _effects = [_smokeBarrel];

{
    private _position = if (_x != "#noselection") then {
        _vehicle selectionPosition _x
    } else {
        [0, -2, 0]
    };

    private _smoke = "#particlesource" createVehicleLocal [0, 0, 0];
    _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
    _smoke attachTo [_vehicle, _position];

    _effects pushBack _smoke;
} forEach _selections;

_vehicle setVariable [QGVAR(effects), _effects];
