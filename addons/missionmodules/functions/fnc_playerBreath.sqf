/*
 * Author: joko // Jonas and Exikas
 * Create a PFH for a Breathing Effect for player in closer distance
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_missionModules_fnc_playerBreath
 *
 * Public: Yes
 */
#include "script_component.hpp"

if !(hasInterface) exitWith {};
if !(GVAR(breathEnabled)) exitWith {};
if !(local ACE_player) exitWith {};


// define the Crate Breathing Effect Function
DFUNC(crateBreathingEffect) = {
    private ["_source", "_fog"];

    // create the Logic where the Partice Effect emitt from and create the particlesource.
    _source = "logic" createVehicleLocal (getpos _this);
    _fog = "#particlesource" createVehicleLocal getpos _source;

    // attacht the Particle effect that it look like the particle came out of the mouth
    _source attachto [_this, [0,0.15,0], "neck"];

    // set the Partice effect Parameter
    _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _fog setDropInterval 0.01;
    _fog setParticleParams [
        [
            "\A3\data_f\ParticleEffects\Universal\Universal",
            16,
            12,
            13,
            0
        ],
        "",
        "Billboard",
        0.5,
        0.5,
        [0,0,0],
        [0, 0.2, -0.2],
        1, 1.275,
        1, 0.2,
        [0, 0.2,0],
        [[1,1,1,0.1], [1,1,1, 0.01], [1,1,1, 0]],
        [1000],
        1,
        0.04,
        "",
        "",
        _source
    ];

    // Add waitAndExecute for Remove Particel Effect
    [{
        params ["_source", "_fog", "_unit"];
        deleteVehicle _source;
        deleteVehicle _fog;
        _unit setVariable [QGVAR(breath), false];
    }, [_source, _fog, _this], 8] call EFUNC(common,waitAndExecute);
};


GVAR(debugPFHID) = [{
    if !(GVAR(breathEnabled)) exitWith {};
    if (!GVAR(breathIsForced) || {GVAR(currentTemperature) <= GVAR(breathTemperature)} || {(GVAR(breathTimeStart) > ACE_time && {GVAR(breathTimeEnd) < ACE_time})}) exitWith {};

    scopeName "PFHBreath";
    private ["_unit", "_array"];


    {
        // Check if a Player in the current Distance is Speaking
        if (GVAR(bySpeaking)) then {
            if (_x distance ACE_player <= GVAR(MaxBreathingDistance) && {!(_x getVariable [QGVAR(breath), true])} && {_x call EFUNC(nametags,isSpeaking)}) then {
                _x call FUNC(crateBreathingEffect);
            };
        };

        //Chec if a Unit that is in Distance dont have a Breathing Effect and _unit is not assigned
        if (isNil "_unit" && !(_x getVariable [QGVAR(breath), false]) && {_x distance ACE_player <= GVAR(MaxBreathingDistance)}) then {
            _unit = _x;
        };
    } count ([allUnits, allPlayers] select GVAR(onlyPlayer));

    // create Breathing Effect
    if (isNil "_unit") exitWith {};
    _unit call FUNC(crateBreathingEffect);

}, 0, []] call CBA_fnc_addPerFrameHandler;
