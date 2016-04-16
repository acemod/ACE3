/*
 * Author: BaerMitUmlaut
 * Main perFrameHandler that updates fatigue values.
 *
 * Arguments:
 * 0: PFH arguments <ARRAY>
 * 1: PFH handler <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[_unit], 0] call ace_advanced_fatigue_fnc_pfhMain
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_args", "_pfhHandle"];
private ["_currentWork", "_ae1Reserve", "_ae2Reserve", "_anReserve",
    "_anFatigue", "_muscleDamage", "_ae1PathwayPower", "_ae2PathwayPower",
    "_anPathwayPower", "_muscleIntegrity", "_ae1PathwayPowerFatigued",
    "_ae2PathwayPowerFatigued", "_anPathwayPowerFatigued", "_ae1Power",
    "_ae2Power", "_anPower", "_aeReservePercentage", "_currentSpeed"];

if (isNull ACE_player) exitWith {}; // Map intros

_currentWork = REE;
_currentSpeed = (vectorMagnitude (velocity ACE_player)) min 6;
if ((vehicle ACE_player == ACE_player) && {_currentSpeed > 0.1}) then {
    _currentWork = [ACE_player, _currentSpeed] call FUNC(getMetabolicCosts);
    _currentWork = _currentWork max REE;
};

_ae1Reserve = ACE_player getVariable [QGVAR(ae1Reserve), 4000000];
_ae2Reserve = ACE_player getVariable [QGVAR(ae2Reserve), 84000];
_anReserve  = ACE_player getVariable [QGVAR(anReserve), 2300];
_anFatigue  = ACE_player getVariable [QGVAR(anFatigue), 0];
_muscleDamage  = ACE_player getVariable [QGVAR(muscleDamage), 0];

_ae1PathwayPower = ACE_player getVariable [QGVAR(ae1PathwayPower), 0];
_ae2PathwayPower = ACE_player getVariable [QGVAR(ae2PathwayPower), 0];
_anPathwayPower  = ACE_player getVariable [QGVAR(anPathwayPower), 0];

if (_ae1PathwayPower == 0) then {
    _ae1PathwayPower = PEAKPOWER / (13.3 + 16.7 + 113.3) *  13.3 * 1.362;
    _ae2PathwayPower = PEAKPOWER / (13.3 + 16.7 + 113.3) *  16.7 * 1.362;
    _anPathwayPower  = PEAKPOWER - _ae1PathwayPower - _ae2PathwayPower;
    ACE_player setVariable [QGVAR(ae1PathwayPower), _ae1PathwayPower];
    ACE_player setVariable [QGVAR(ae2PathwayPower), _ae2PathwayPower];
    ACE_player setVariable [QGVAR(anPathwayPower), _anPathwayPower];
};

_muscleDamage = _muscleDamage + (_currentWork/PEAKPOWER)^3.2 * 0.00004;
_muscleIntegrity = 1 - _muscleDamage;

_ae1PathwayPowerFatigued = _ae1PathwayPower * sqrt (_ae1Reserve/4000000) * OXYGEN * sqrt _muscleIntegrity;
_ae2PathwayPowerFatigued = _ae2PathwayPower * sqrt (_ae2Reserve/84000)   * OXYGEN * sqrt _muscleIntegrity;
_anPathwayPowerFatigued  = _anPathwayPower  * sqrt (_anReserve/2300)     * OXYGEN * sqrt _muscleIntegrity;

_ae1Power = (_currentWork max 0) min _ae1PathwayPowerFatigued;
_ae2Power = ((_currentWork - _ae1Power) max 0) min _ae2PathwayPowerFatigued;
_anPower = (_currentWork - _ae1Power - _ae2Power) max 0;

// Anearobic fatigue increase and ATP reserve decrease
_ae1Reserve = _ae1Reserve - _ae1Power/WATTSPERATP;
_ae2Reserve = _ae2Reserve - _ae2Power/WATTSPERATP;
_anReserve = _anReserve - _anPower/WATTSPERATP;
_anFatigue = _anFatigue + _anPower * (0.057/PEAKPOWER) * 1.1;

// Anearobic fatigue and ATP reserve recovery
_ae1Reserve = ((_ae1Reserve + OXYGEN * 6.6 * (_ae1PathwayPower - _ae1Power) / _ae1PathwayPower) min 4000000) max 0;
_ae2Reserve = ((_ae2Reserve + OXYGEN * 5.83 * (_ae2PathwayPower - _ae2Power) / _ae2PathwayPower) min 84000) max 0;
_anReserve = ((_anReserve + (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) / VO2MAXPOWER * 56.7 * 1 * _anFatigue^2) min 2300) max 0;
_anFatigue = ((_anFatigue - (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) * (0.057/PEAKPOWER) * _anFatigue^2) min 1) max 0;

_aeReservePercentage = (_ae1Reserve / 4000000 + _ae2Reserve / 84000) / 2;

if (_anReserve == 0) then {
    [ACE_player, 1 - ((_anReserve / 2300) min _aeReservePercentage), true] call FUNC(effectsHandler);
} else {
    [ACE_player, 1 - ((_anReserve / 2300) min _aeReservePercentage)] call FUNC(effectsHandler);
};

ACE_player setVariable [QGVAR(ae1Reserve), _ae1Reserve];
ACE_player setVariable [QGVAR(ae2Reserve), _ae2Reserve];
ACE_player setVariable [QGVAR(anReserve), _anReserve];
ACE_player setVariable [QGVAR(anFatigue), _anFatigue];
ACE_player setVariable [QGVAR(muscleDamage), _muscleDamage];
