#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2
 * Start fire in engine block of a car.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_engineFireLocal
 *
 * Public: No
 */

params ["_vehicle", "_endTime"];

// For JIP players and if the time wasn't set properly
if (_endTime < CBA_missionTime) exitWith {};

private _smoke = objNull;

if (hasInterface) then {
    // Get offset for engine smoke if there is one
    private _offset = getArray (configOf _vehicle >> QGVAR(engineSmokeOffset));

    if (_offset isEqualTo []) then {
        _offset = [0, 0, 0];
    };

    private _position = [
        0,
        (boundingBoxReal _vehicle select 1 select 1) - 2,
        (boundingBoxReal _vehicle select 0 select 2) + 2
    ] vectorAdd _offset;

    // Spawn smoke
    _smoke = "#particlesource" createVehicleLocal [0, 0, 0];
    _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
    _smoke attachTo [_vehicle, _position];
};

[{
    (_this select 0) params ["_vehicle", "_smoke", "_endTime"];

    if (!alive _vehicle || {_vehicle getHitPointDamage "HitEngine" < 0.9} || {CBA_missionTime >= _endTime}) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        deleteVehicle _smoke;

        if (isNull _vehicle) exitWith {};

        if (isServer) then {
            (_vehicle getVariable [QGVAR(engineFireJipID), ""]) call CBA_fnc_removeGlobalEventJIP;
        };

        _vehicle setVariable [QGVAR(isEngineSmoking), false];
    };
}, 5, [_vehicle, _smoke, _endTime]] call CBA_fnc_addPerFrameHandler;
