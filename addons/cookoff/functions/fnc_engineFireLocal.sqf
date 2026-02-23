#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Start fire in engine block of a car.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: End time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, CBA_missionTime + 10] call ace_cookoff_fnc_engineFireLocal
 *
 * Public: No
 */

params ["_vehicle", "_endTime"];

// For JIP players and if the time wasn't set properly
if (_endTime < CBA_missionTime) exitWith {};

private _smoke = objNull;

if (hasInterface) then {
    private _hitPoints = getAllHitPointsDamage _vehicle;

    // Get hitpoint for engine
    private _index = if (_hitPoints isNotEqualTo []) then {
        (_hitPoints select 0) findIf {_x == "hitengine"}
    } else {
        -1
    };

    // Get corresponding selection
    private _position = if (_index != -1) then {
        _vehicle selectionPosition [(_hitPoints select 1) select _index, "HitPoints", "AveragePoint"]
    } else {
        [0, 0, 0]
    };

    if (_position isEqualTo [0, 0, 0]) then {
        // Get offset for engine smoke if there is one
        private _offset = getArray (configOf _vehicle >> QGVAR(engineSmokeOffset));

        if (_offset isEqualTo []) then {
            _offset = [0, 0, 0];
        };

        _position = [
            0,
            (boundingBoxReal _vehicle select 1 select 1) - 2,
            (boundingBoxReal _vehicle select 0 select 2) + 2
        ] vectorAdd _offset;
    };

    // Spawn smoke
    _smoke = createVehicleLocal ["#particlesource", ASLToAGL getPosASL _vehicle, [], 0, "CAN_COLLIDE"];
    _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
    _smoke attachTo [_vehicle, _position];
};

[{
    (_this select 0) params ["_vehicle", "_smoke", "_endTime"];

    if (alive _vehicle && {_vehicle getHitPointDamage "HitEngine" >= 0.9} && {CBA_missionTime < _endTime}) exitWith {};

    (_this select 1) call CBA_fnc_removePerFrameHandler;

    deleteVehicle _smoke;

    if (!isServer || {isNull _vehicle}) exitWith {};

    // Reset variable, so engine can smoke again in the future
    _vehicle setVariable [QGVAR(isEngineSmoking), nil, true];

    private _jipID = _vehicle getVariable QGVAR(engineFireJipID);

    if (isNil "_jipID") exitWith {};

    _jipID call CBA_fnc_removeGlobalEventJIP;

    _vehicle setVariable [QGVAR(engineFireJipID), nil];
}, 5, [_vehicle, _smoke, _endTime]] call CBA_fnc_addPerFrameHandler;
