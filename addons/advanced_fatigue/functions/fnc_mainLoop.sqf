#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, ulteq
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

// Dead people don't breathe, will also handle null (map intros)
if (!alive ACE_player) exitWith {
    [LINKFUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;

    private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
    _staminaBarContainer ctrlSetFade 1;
    _staminaBarContainer ctrlCommit 1;
};

private _velocity = velocity ACE_player;
private _normal = surfaceNormal (getPosWorld ACE_player);
private _movementVector = vectorNormalized _velocity;
private _fwdAngle = asin (_movementVector select 2);
private _sideAngle = if ((getPosATL ACE_player) select 2 > 0.01) then {
    0 // ignore terrain normal if not touching it
} else {
    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    asin (_sideVector select 2);
};
if (GVAR(isSwimming)) then { // ignore when floating
    _fwdAngle = 0;
    _sideAngle = 0;
};


private _currentWork = REE;
private _currentSpeed = (vectorMagnitude _velocity) min 6;

// fix #4481. Diving to the ground is recorded as PRONE stance with running speed velocity. Cap maximum speed to fix.
if (GVAR(isProne)) then {
    _currentSpeed = _currentSpeed min 1.5;
};

private _terrainGradient = abs _fwdAngle;
private _terrainFactor = 1;
private _gearMass = 0 max (((ACE_player getVariable [QEGVAR(movement,totalLoad), loadAbs ACE_player]) / 22.046 - UNDERWEAR_WEIGHT) * GVAR(loadFactor));

if (isNull objectParent ACE_player && {_currentSpeed > 0.1} && {isTouchingGround ACE_player || {underwater ACE_player}}) then {
    if (!GVAR(isSwimming)) then {
        // If the unit is going downhill, it's much less demanding
        if (_fwdAngle < 0) then {
            _terrainGradient = 0.15 * _terrainGradient;
        };

        // Used to simulate the unevenness/roughness of the terrain
        if (_sideAngle != 0) then {
            private _sideGradient = abs (_sideAngle / 45) min 1;

            _terrainFactor = 1 + _sideGradient ^ 4;
        };
    };

    // Add a scaling factor of 0.1 to reduce excessive stamina consumption on default settings (see #10361)
    _currentWork = [_gearMass, _terrainGradient * GVAR(terrainGradientFactor) * 0.1, _terrainFactor, _currentSpeed] call FUNC(getMetabolicCosts);
    _currentWork = _currentWork max REE;
};

// Oxygen calculation
private _oxygen =  if (GETEGVAR(medical,enabled,false) && {EGVAR(medical_vitals,simulateSpo2)}) then { // Defer to medical
    (ACE_player getVariable [QEGVAR(medical,spo2), 97]) / 100
} else {
    1 - 0.131 * GVAR(respiratoryRate) ^ 2 // Default AF oxygen saturation
};
// Calculate muscle damage increase
GVAR(muscleDamage) = GVAR(muscleDamage) + (_currentWork / GVAR(peakPower)) ^ 3.2 * MUSCLE_TEAR_RATE;

// Calculate muscle damage recovery
GVAR(muscleDamage) = 0 max (GVAR(muscleDamage) - MUSCLE_RECOVERY * GVAR(recoveryFactor)) min 1;
private _muscleIntegrity = 1 - GVAR(muscleDamage);
private _muscleFactor = sqrt _muscleIntegrity;

// Calculate available power
private _ae1PathwayPowerFatigued = GVAR(ae1PathwayPower) * sqrt (GVAR(ae1Reserve) / AE1_MAXRESERVE) * _oxygen * _muscleFactor;
private _ae2PathwayPowerFatigued = GVAR(ae2PathwayPower) * sqrt (GVAR(ae2Reserve) / AE2_MAXRESERVE) * _oxygen * _muscleFactor;
private _aePathwayPowerFatigued  = _ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued;
// private _anPathwayPowerFatigued  = GVAR(anPathwayPower) * sqrt (GVAR(anReserve) / AN_MAXRESERVE) * _oxygen * _muscleIntegrity; // not used

// Calculate how much power is consumed from each reserve
private _ae1Power = _currentWork min _ae1PathwayPowerFatigued;
private _ae2Power = (_currentWork - _ae1Power) min _ae2PathwayPowerFatigued;
private _anPower  = 0 max (_currentWork - _ae1Power - _ae2Power);

// Remove ATP from reserves for current work
GVAR(ae1Reserve) = 0 max (GVAR(ae1Reserve) - _ae1Power / GVAR(aeWattsPerATP));
GVAR(ae2Reserve) = 0 max (GVAR(ae2Reserve) - _ae2Power / GVAR(aeWattsPerATP));
GVAR(anReserve)  = 0 max (GVAR(anReserve)  -  _anPower / GVAR(anWattsPerATP));

// Acidosis accumulation
GVAR(anFatigue)  = GVAR(anFatigue) + _anPower * GVAR(maxPowerFatigueRatio) * 1.1;

// Aerobic ATP reserve recovery
GVAR(ae1Reserve) = (GVAR(ae1Reserve) + _oxygen * GVAR(recoveryFactor) * AE1_ATP_RECOVERY * (GVAR(ae1PathwayPower) - _ae1Power) / GVAR(ae1PathwayPower)) min AE1_MAXRESERVE;
GVAR(ae2Reserve) = (GVAR(ae2Reserve) + _oxygen * GVAR(recoveryFactor) * AE2_ATP_RECOVERY * (GVAR(ae2PathwayPower) - _ae2Power) / GVAR(ae2PathwayPower)) min AE2_MAXRESERVE;

private _aeSurplus = _ae1PathwayPowerFatigued + _ae2PathwayPowerFatigued - _ae1Power - _ae2Power;

// Anaerobic ATP reserve recovery
GVAR(anReserve) = 0 max (GVAR(anReserve) + _aeSurplus / GVAR(VO2MaxPower) * AN_ATP_RECOVERY * GVAR(recoveryFactor) * (GVAR(anFatigue) max linearConversion [AN_MAXRESERVE, 0, GVAR(anReserve), 0, 0.75, true]) ^ 2) min AN_MAXRESERVE; // max linearConversion ensures that if GVAR(anFatigue) is very low, it will still regenerate reserves
// Acidosis recovery
GVAR(anFatigue) = 0 max (GVAR(anFatigue) - _aeSurplus * GVAR(maxPowerFatigueRatio) * GVAR(recoveryFactor) * GVAR(anFatigue) ^ 2) min 1;

// Respiratory rate decrease
GVAR(respiratoryRate) = GVAR(respiratoryRate) * GVAR(respiratoryBufferDivisor);

// Respiratory rate increase
private _aePowerRatio = (GVAR(aePathwayPower) / _aePathwayPowerFatigued) min 2;
private _respiratorySampleDivisor = 1 / (RESPIRATORY_BUFFER * 4.72 * GVAR(VO2Max));
GVAR(respiratoryRate) = (GVAR(respiratoryRate) + _currentWork * _respiratorySampleDivisor * _aePowerRatio) min 1;

// Calculate a pseudo-perceived fatigue, which is used for effects
GVAR(aeReservePercentage) = (GVAR(ae1Reserve) / AE1_MAXRESERVE + GVAR(ae2Reserve) / AE2_MAXRESERVE) / 2;
GVAR(anReservePercentage) = GVAR(anReserve) / AN_MAXRESERVE;
private _perceivedFatigue = 1 - (GVAR(anReservePercentage) min GVAR(aeReservePercentage));

#ifdef DEBUG_MODE_FULL
systemChat format ["---- muscleDamage: %1 ----", GVAR(muscleDamage) toFixed 8];
systemChat format ["---- ae2: %1 - an: %2 ----", (GVAR(ae2Reserve) / AE2_MAXRESERVE) toFixed 2, (GVAR(anReserve) / AN_MAXRESERVE) toFixed 2];
systemChat format ["---- anFatigue: %1 - perceivedFatigue: %2 ----", GVAR(anFatigue) toFixed 2, _perceivedFatigue toFixed 2];
systemChat format ["---- velocity %1 - respiratoryRate: %2 ----", (vectorMagnitude _velocity) toFixed 2, GVAR(respiratoryRate) toFixed 2];
// systemChat format ["---- aePower: %1 ----", _aePathwayPowerFatigued toFixed 1];
#endif

[ACE_player, _perceivedFatigue, GVAR(anReserve) == 0, _fwdAngle, _sideAngle] call FUNC(handleEffects);

if (GVAR(enableStaminaBarRealized)) then {
    [GVAR(anReserve) / AN_MAXRESERVE] call FUNC(handleStaminaBar);
};

[LINKFUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
