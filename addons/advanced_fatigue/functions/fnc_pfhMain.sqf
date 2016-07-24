/*
 * Author: BaerMitUmlaut
 * Main perFrameHandler that updates fatigue values.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

if (isNull ACE_player) exitWith {}; // Map intros

private _currentWork = REE;
private _currentSpeed = (vectorMagnitude (velocity ACE_player)) min 6;
if ((vehicle ACE_player == ACE_player) && {_currentSpeed > 0.1} && {isTouchingGround ACE_player || {underwater ACE_player}}) then {
    _currentWork = [ACE_player, _currentSpeed] call FUNC(getMetabolicCosts);
    _currentWork = _currentWork max REE;
};

private _ae1Reserve      = ACE_player getVariable [QGVAR(ae1Reserve), AE1_MAXRESERVE];
private _ae2Reserve      = ACE_player getVariable [QGVAR(ae2Reserve), AE2_MAXRESERVE];
private _anReserve       = ACE_player getVariable [QGVAR(anReserve), AN_MAXRESERVE];
private _anFatigue       = ACE_player getVariable [QGVAR(anFatigue), 0];
private _muscleDamage    = ACE_player getVariable [QGVAR(muscleDamage), 0];

private _ae1PathwayPower = ACE_player getVariable [QGVAR(ae1PathwayPower), 0];
private _ae2PathwayPower = ACE_player getVariable [QGVAR(ae2PathwayPower), 0];
private _anPathwayPower  = ACE_player getVariable [QGVAR(anPathwayPower), 0];

if (_ae1PathwayPower == 0) then {
    _ae1PathwayPower = PEAKPOWER / (13.3 + 16.7 + 113.3) * 13.3 * ANTPERCENT ^ 1.28 * 1.362;
    _ae2PathwayPower = PEAKPOWER / (13.3 + 16.7 + 113.3) * 16.7 * ANTPERCENT ^ 1.28 * 1.362;
    _anPathwayPower  = PEAKPOWER - _ae1PathwayPower - _ae2PathwayPower;
    ACE_player setVariable [QGVAR(ae1PathwayPower), _ae1PathwayPower];
    ACE_player setVariable [QGVAR(ae2PathwayPower), _ae2PathwayPower];
    ACE_player setVariable [QGVAR(anPathwayPower), _anPathwayPower];
};

// Calculate muscle damage increase
// Note: Muscle damage recovery is ignored as it takes multiple days
_muscleDamage = _muscleDamage + (_currentWork / PEAKPOWER) ^ 3.2 * 0.00004;
private _muscleIntegrity = 1 - _muscleDamage;

// Calculate available power
private _ae1PathwayPowerFatigued = _ae1PathwayPower * sqrt (_ae1Reserve / AE1_MAXRESERVE) * OXYGEN * sqrt _muscleIntegrity;
private _ae2PathwayPowerFatigued = _ae2PathwayPower * sqrt (_ae2Reserve / AE2_MAXRESERVE) * OXYGEN * sqrt _muscleIntegrity;

// Calculate how much power is consumed from each reserve
private _ae1Power = _currentWork min _ae1PathwayPowerFatigued;
private _ae2Power = ((_currentWork - _ae1Power) max 0) min _ae2PathwayPowerFatigued;
private _anPower  = (_currentWork - _ae1Power - _ae2Power) max 0;

// Remove ATP from reserves for current work
_ae1Reserve = _ae1Reserve - _ae1Power / WATTSPERATP;
_ae2Reserve = _ae2Reserve - _ae2Power / WATTSPERATP;
_anReserve  =  _anReserve -  _anPower / WATTSPERATP;
// Increase anearobic fatigue
_anFatigue  = _anFatigue + _anPower * (0.057 / PEAKPOWER) * 1.1;

// Aerobic ATP reserve recovery
_ae1Reserve = ((_ae1Reserve + OXYGEN * 6.60 * (_ae1PathwayPower - _ae1Power) / _ae1PathwayPower * GVAR(recoveryFactor)) min AE1_MAXRESERVE) max 0;
_ae2Reserve = ((_ae2Reserve + OXYGEN * 5.83 * (_ae2PathwayPower - _ae2Power) / _ae2PathwayPower * GVAR(recoveryFactor)) min AE2_MAXRESERVE) max 0;
// Anaerobic ATP reserver and fatigue recovery
_anReserve = ((_anReserve + (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) / VO2MAXPOWER * 56.7 * _anFatigue ^ 2 * GVAR(recoveryFactor)) min AN_MAXRESERVE) max 0;
_anFatigue = ((_anFatigue - (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) * (0.057 / PEAKPOWER) * _anFatigue ^ 2 * GVAR(recoveryFactor)) min 1) max 0;

private _aeReservePercentage = (_ae1Reserve / AE1_MAXRESERVE + _ae2Reserve / AE2_MAXRESERVE) / 2;
private _anReservePercentage = _anReserve / AN_MAXRESERVE;
private _perceivedFatigue = 1 - (_anReservePercentage min _aeReservePercentage);
[ACE_player, _perceivedFatigue, _currentSpeed, _anReserve == 0] call FUNC(handleEffects);

ACE_player setVariable [QGVAR(ae1Reserve), _ae1Reserve];
ACE_player setVariable [QGVAR(ae2Reserve), _ae2Reserve];
ACE_player setVariable [QGVAR(anReserve), _anReserve];
ACE_player setVariable [QGVAR(anFatigue), _anFatigue];
ACE_player setVariable [QGVAR(muscleDamage), _muscleDamage];
