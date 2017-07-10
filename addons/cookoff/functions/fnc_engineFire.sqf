/*
 * Author: KoffeinFlummi, commy2
 * Start fire in engine block of a car.
 *
 * Arguments:
 * 0: Vehicle <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * (vehicle player) call ace_cookoff_fnc_engineFire
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

if (_vehicle getVariable [QGVAR(isEngineSmoking), false]) exitWith {};
_vehicle setVariable [QGVAR(isEngineSmoking), true];

if (local _vehicle) then {
    [QGVAR(engineFire), _vehicle] call CBA_fnc_remoteEvent;
};

private _offset = getArray (_vehicle call CBA_fnc_getObjectConfig >> QGVAR(engineSmokeOffset));

if (_offset isEqualTo []) then {
    _offset = [0,0,0];
};

private _position = [
    0,
    (boundingBoxReal _vehicle select 1 select 1) - 2,
    (boundingBoxReal _vehicle select 0 select 2) + 2
] vectorAdd _offset;

private _smoke = "#particlesource" createVehicleLocal [0,0,0];
_smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
_smoke attachTo [_vehicle, _position];

[{
    (_this select 0) params ["_vehicle", "_smoke", "_time"];

    if (!alive _vehicle || {_vehicle getHitPointDamage "HitEngine" < 0.9} || {CBA_missionTime > _time}) then {
        deleteVehicle _smoke;
        _vehicle setVariable [QGVAR(isEngineSmoking), false];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
}, 5, [_vehicle, _smoke, CBA_missionTime + 240]] call CBA_fnc_addPerFrameHandler;
