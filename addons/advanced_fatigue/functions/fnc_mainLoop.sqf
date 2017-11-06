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

private _normal = surfaceNormal (getPosWorld ACE_player);
private _movementVector = vectorNormalized (velocity ACE_player);
private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
private _fwdAngle = asin (_movementVector select 2) * GVAR(terrainGradientFactor);
private _sideAngle = asin (_sideVector select 2) * GVAR(terrainGradientFactor);

private _currentWork = REE;
private _currentSpeed = (vectorMagnitude (velocity ACE_player)) min 6;

// fix #4481. Diving to the ground is recorded as PRONE stance with running speed velocity. Cap maximum speed to fix.
if (GVAR(isProne)) then {
    _currentSpeed = _currentSpeed min 1.5;
};

if ((vehicle ACE_player == ACE_player) && {_currentSpeed > 0.1} && {isTouchingGround ACE_player || {underwater ACE_player}}) then {
    _currentWork = [ACE_player, _currentSpeed, _fwdAngle, _sideAngle] call FUNC(getMetabolicCosts);
    _currentWork = _currentWork max REE;
};

// Oxygen calculation
private _oxygen = 1 - 0.126 * GVAR(respiratoryRate) ^ 2;

// Calculate muscle damage increase
GVAR(muscleDamage) = (GVAR(muscleDamage) + (_currentWork / GVAR(peakPower)) ^ 3.2 * MUSCLE_TEAR_RATE) min 1;
// Calculate muscle damage decrease
GVAR(muscleDamage) = 0 max (GVAR(muscleDamage) - MUSCLE_RECOVERY);
private _muscleIntegrity = 1 - GVAR(muscleDamage);
private _muscleFactor = sqrt (_muscleIntegrity);

// Calculate available power
private _ae1PathwayPowerFatigued = GVAR(ae1PathwayPower) * sqrt (GVAR(ae1Reserve) / AE1_MAXRESERVE) * _oxygen * _muscleFactor;
private _ae2PathwayPowerFatigued = GVAR(ae2PathwayPower) * sqrt (GVAR(ae2Reserve) / AE2_MAXRESERVE) * _oxygen * _muscleFactor;
private _aePathwayPowerFatigued  = _ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued;

// Calculate how much power is consumed from each reserve
private _ae1Power = _currentWork min _ae1PathwayPowerFatigued;
private _ae2Power = (_currentWork - _ae1Power) min _ae2PathwayPowerFatigued;
private _anPower  = 0 max (_currentWork - _ae1Power - _ae2Power);

// Remove ATP from reserves for current work
GVAR(ae1Reserve) = 0 max (GVAR(ae1Reserve) - _ae1Power / GVAR(aeWattsPerATP));
GVAR(ae2Reserve) = 0 max (GVAR(ae2Reserve) - _ae2Power / GVAR(aeWattsPerATP));
GVAR(anReserve)  = 0 max (GVAR(anReserve)  -  _anPower / GVAR(anWattsPerATP));
#ifdef DEBUG_MODE_FULL
systemChat format["---- ae2: %1 ----", (GVAR(ae2Reserve) / AE2_MAXRESERVE) toFixed 2];
systemChat format["---- an: %1 ----", (GVAR(anReserve) / AN_MAXRESERVE) toFixed 2];
systemChat format["---- anFatigue: %1 ----", GVAR(anFatigue) toFixed 2];
systemChat format["---- muscleDamage: %1 ----", GVAR(muscleDamage) toFixed 2];
systemChat format["---- respiratoryRate: %1 ----", GVAR(respiratoryRate) toFixed 2];
systemChat format["---- aePower: %1 ----", _aePathwayPowerFatigued toFixed 1];
#endif

// Acidosis accumulation
GVAR(anFatigue)  = GVAR(anFatigue) + _anPower * GVAR(maxPowerFatigueRatio) * 1.1;

// Aerobic ATP reserve recovery
GVAR(ae1Reserve) = (GVAR(ae1Reserve) + _oxygen * GVAR(recoveryFactor) * AE1_ATP_RECOVERY * (GVAR(ae1PathwayPower) - _ae1Power) / GVAR(ae1PathwayPower)) min AE1_MAXRESERVE;
GVAR(ae2Reserve) = (GVAR(ae2Reserve) + _oxygen * GVAR(recoveryFactor) * AE2_ATP_RECOVERY * (GVAR(ae2PathwayPower) - _ae2Power) / GVAR(ae2PathwayPower)) min AE2_MAXRESERVE;

private _aeSurplus = _ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power;
// Anaerobic ATP reserve recovery
GVAR(anReserve) = (GVAR(anReserve) + _aeSurplus / GVAR(VO2MaxPower) * AN_ATP_RECOVERY * GVAR(recoveryFactor) * GVAR(anFatigue) ^ 2) min AN_MAXRESERVE;
// Acidosis recovery
GVAR(anFatigue) = 0 max (GVAR(anFatigue) - _aeSurplus * GVAR(maxPowerFatigueRatio) * GVAR(recoveryFactor) * GVAR(anFatigue) ^ 2) min 1;

// Respiratory rate decrease
GVAR(respiratoryRate) = GVAR(respiratoryRate) * GVAR(respiratoryBufferDivisor);

// Respiratory rate increase
private _aePowerRatio = (GVAR(aePathwayPower) / _aePathwayPowerFatigued) min 2;
private _respiratorySampleDivisor = 1 / (RESPIRATORY_BUFFER * 4.75 * GVAR(VO2Max));
GVAR(respiratoryRate) = (GVAR(respiratoryRate) + _currentWork * _respiratorySampleDivisor * _aePowerRatio) min 1;

[ACE_player, GVAR(anFatigue), _currentSpeed, GVAR(respiratoryRate), _fwdAngle, _sideAngle] call FUNC(handleEffects);

if (GVAR(enableStaminaBar)) then {
    [GVAR(anReserve) / AN_MAXRESERVE] call FUNC(handleStaminaBar);
};

[FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
