/*
 * Author: BaerMitUmlaut
 * Main looping function that updates fatigue values.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_fatigue_fnc_mainLoop
 *
 * Public: No
 */
#include "script_component.hpp"
if (!alive ACE_player) exitWith { // Dead people don't breath, Will also handle null (Map intros)
    [FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
    private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
    _staminaBarContainer ctrlSetFade 1;
    _staminaBarContainer ctrlCommit 1;
};

private _currentWork = REE;
private _currentSpeed = (vectorMagnitude (velocity ACE_player)) min 6;

// fix #4481. Diving to the ground is recorded as PRONE stance with running speed velocity. Cap maximum speed to fix.
if (GVAR(isProne)) then {
    _currentSpeed = _currentSpeed min 1.5;
};

if ((vehicle ACE_player == ACE_player) && {_currentSpeed > 0.1} && {isTouchingGround ACE_player || {underwater ACE_player}}) then {
    _currentWork = [ACE_player, _currentSpeed] call FUNC(getMetabolicCosts);
    _currentWork = _currentWork max REE;
};

// Calculate muscle damage increase
// Note: Muscle damage recovery is ignored as it takes multiple days
GVAR(muscleDamage) = GVAR(muscleDamage) + (_currentWork / GVAR(peakPower)) ^ 3.2 * 0.00004;
private _muscleIntegritySqrt = sqrt (1 - GVAR(muscleDamage));

// Calculate available power
private _ae1PathwayPowerFatigued = GVAR(ae1PathwayPower) * sqrt (GVAR(ae1Reserve) / AE1_MAXRESERVE) * OXYGEN * _muscleIntegritySqrt;
private _ae2PathwayPowerFatigued = GVAR(ae2PathwayPower) * sqrt (GVAR(ae2Reserve) / AE2_MAXRESERVE) * OXYGEN * _muscleIntegritySqrt;

// Calculate how much power is consumed from each reserve
private _ae1Power = _currentWork min _ae1PathwayPowerFatigued;
private _ae2Power = ((_currentWork - _ae1Power) max 0) min _ae2PathwayPowerFatigued;
private _anPower  = (_currentWork - _ae1Power - _ae2Power) max 0;

// Remove ATP from reserves for current work
GVAR(ae1Reserve) = GVAR(ae1Reserve) - _ae1Power / WATTSPERATP;
GVAR(ae2Reserve) = GVAR(ae2Reserve) - _ae2Power / WATTSPERATP;
GVAR(anReserve)  = GVAR(anReserve)  -  _anPower / WATTSPERATP;
// Increase anearobic fatigue
GVAR(anFatigue)  = GVAR(anFatigue) + _anPower * (0.057 / GVAR(peakPower)) * 1.1;

// Aerobic ATP reserve recovery
GVAR(ae1Reserve) = ((GVAR(ae1Reserve) + OXYGEN * 6.60 * (GVAR(ae1PathwayPower) - _ae1Power) / GVAR(ae1PathwayPower) * GVAR(recoveryFactor)) min AE1_MAXRESERVE) max 0;
GVAR(ae2Reserve) = ((GVAR(ae2Reserve) + OXYGEN * 5.83 * (GVAR(ae2PathwayPower) - _ae2Power) / GVAR(ae2PathwayPower) * GVAR(recoveryFactor)) min AE2_MAXRESERVE) max 0;

// Anaerobic ATP reserver and fatigue recovery
GVAR(anReserve) = ((GVAR(anReserve)
    + (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) / GVAR(VO2MaxPower) * 56.7 * GVAR(anFatigue) ^ 2 * GVAR(recoveryFactor)
) min AN_MAXRESERVE) max 0;

GVAR(anFatigue) = ((GVAR(anFatigue)
    - (_ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power) * (0.057 / GVAR(peakPower)) * GVAR(anFatigue) ^ 2 * GVAR(recoveryFactor)
) min 1) max 0;

private _aeReservePercentage = (GVAR(ae1Reserve) / AE1_MAXRESERVE + GVAR(ae2Reserve) / AE2_MAXRESERVE) / 2;
private _anReservePercentage = GVAR(anReserve) / AN_MAXRESERVE;
private _perceivedFatigue = 1 - (_anReservePercentage min _aeReservePercentage);

[ACE_player, _perceivedFatigue, _currentSpeed, GVAR(anReserve) == 0] call FUNC(handleEffects);

if (GVAR(enableStaminaBar)) then {
    [GVAR(anReserve) / AN_MAXRESERVE] call FUNC(handleStaminaBar);
};

[FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
