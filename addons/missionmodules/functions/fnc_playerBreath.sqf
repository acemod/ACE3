/*
 * Author: joko // Jonas and Exo
 * Create a PFH for a Breathing Effect for player in closer distance
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_weather_fnc_playerBreath
 *
 * Public: Yes
 */
#include "script_component.hpp"
if !(hasInterface) exitWith {};
if !(GVAR(breathEnabled)) exitWith {};
if (!GVAR(breathIsForced) || {GVAR(currentTemperature) <= GVAR(breathTemperature)} || {(GVAR(breathTimeStart) > ACE_time && {GVAR(breathTimeEnd) < ACE_time})}) exitWith {};
if !(local ACE_player) exitWith {};


[{
    if (GVAR(breathTimeEnd) < ACE_time && {GVAR(breathTimeStart) > ACE_time}) exitWith {};
    if (({ isPlayer _x } count nearestObjects [ACE_player, ["Man"], GVAR(MaxBreathingDistance)]) > 0) exitWith {};
    GVAR(index) = GVAR(index) + 1;
    _unit = allPlayers select GVAR(index);
    if (underwater _unit) exitWith {};
    _oldTime = _unit getVariable [QGVAR(time),0];
    _newTime = time;
    while {_unit distance ACE_player => GVAR(MaxBreathingDistance)} do {
        GVAR(index) = GVAR(index) + 1;
        _unit = allPlayers select GVAR(index);
        _oldTime = _unit getVariable [QGVAR(time),0];
    };
    if (vehicle _unit == _unit) exitWith {};

    if (isNull (_unit getVariable [QGVAR(source),objNull])) then {
        if (_newTime > _oldTime + (2 + random 2)) then {

            _source = "logic" createVehicleLocal (getpos _unit);
            _fog = "#particlesource" createVehicleLocal getpos _source;
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

            _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
            _fog setDropInterval 0.01;

            _source attachto [_unit,[0,0.15,0], "neck"]; // get fog to come out of player mouth

            _unit setVariable [QGVAR(source),_source];
            _unit setVariable [QGVAR(fog),_fog];
            _unit setVariable [QGVAR(time),time];
        };
    } else {
        if (_newTime > _oldTime + 0.5) then {
            deleteVehicle (_unit getVariable QGVAR(source));
            deleteVehicle (_unit getVariable QGVAR(fog));
        };
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;
