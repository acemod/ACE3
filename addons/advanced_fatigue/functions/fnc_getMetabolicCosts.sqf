/*
 * Author: BaerMitUmlaut
 * Calculates the current metabolic costs for a unit.
 * Calculation is done according to the Pandolf/Wojtowicz formulas.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Metabolic cost <NUMBER>
 *
 * Example:
 * [_player, true] call ace_advanced_fatigue_fnc_getMetabolicCosts
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_velocity"];

private _gearMass = (loadAbs _unit) * 0.1 * 1 / 2.2046;
private _terrainFactor = 1;
private _terrainGradient = 0; //(1 - ([0 , 0, 1] vectorDotProduct (surfaceNormal position ACE_player))) * 8;
private _duty = GVAR(animDuty);

// TODO: Swimming/diving fatigue is awful right now. Needs to use animation coefficient.
if (underwater _unit) then {
    _terrainGradient = 0;
    _duty = 4;
};

if (_velocity > 2) then {
    (
        2.10 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.90 * (_velocity ^ 2) + 0.66 * _velocity *_terrainGradient)
    ) * 0.23 * _duty
} else {
    (
        1.05 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_velocity ^ 2) + 0.66 * _velocity *_terrainGradient)
    ) * 0.23 * _duty
};
