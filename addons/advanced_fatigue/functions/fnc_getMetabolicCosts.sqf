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
private ["_bodyMass", "_gearMass", "_terrainFactor", "_terrainGradient", "_postureWeight", "_duty"];

_bodyMass = 70;
_gearMass = loadAbs _unit * 0.1 * 1/2.2046;
_terrainFactor = 1;
_terrainGradient = (1 - ([0,0,1] vectorDotProduct (surfaceNormal position player))) * 8 + 1;
_duty = GVAR(animDuty);

// TODO: Swimming/diving fatigue is awful right now. Needs to use animation coefficient.
if (underwater _unit) then {
    _terrainGradient = 1;
    _duty = 4;
};

if (_velocity > 2) then {
    2.10*_bodyMass + 4*(_bodyMass+_gearMass)*((_gearMass/_bodyMass)^2) + _terrainFactor*(_bodyMass+_gearMass)*(0.90*(_velocity^2)+0.66*_velocity*_terrainGradient) * 0.23 * _duty
} else {
    1.05*_bodyMass + 2*(_bodyMass+_gearMass)*((_gearMass/_bodyMass)^2) + _terrainFactor*(_bodyMass+_gearMass)*(1.15*(_velocity^2)+0.66*_velocity*_terrainGradient) * 0.23 * _duty
};
