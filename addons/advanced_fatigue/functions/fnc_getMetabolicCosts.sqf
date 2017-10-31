/*
 * Author: BaerMitUmlaut
 * Calculates the current metabolic costs for a unit.
 * Calculation is done according to the Pandolf/Wojtowicz formulas.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Speed <NUMBER>
 *
 * Return Value:
 * Metabolic cost <NUMBER>
 *
 * Example:
 * [player, 3.3] call ace_advanced_fatigue_fnc_getMetabolicCosts
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_movementSpeed"];

private _gearMass = ((_unit getVariable [QEGVAR(movement,totalLoad), loadAbs _unit]) / 22.046) * GVAR(loadFactor);

private _surfaceNormal = surfaceNormal (getPosASL _unit);
private _terrainAngle = asin (1 - (_surfaceNormal select 2));
private _terrainGradient = (_terrainAngle / 45 min 1);
private _terrainFactor = 1;
private _duty = GVAR(animDuty);

{
    if (_x isEqualType 0) then {
        _duty = _duty * _x;
    } else {
        _duty = _duty * (_unit call _x);
    };
} forEach (GVAR(dutyList) select 1);

if (!GVAR(isSwimming)) then {
    private _movementVector = vectorNormalized (velocity _unit);
    private _side = vectorNormalized(_surfaceNormal vectorCrossProduct [0, 0, 1]);
    private _up = vectorNormalized(_surfaceNormal vectorCrossProduct _side);
    private _upGradient = -(_movementVector vectorDotProduct _up) * _terrainGradient;
    private _sideGradient = abs(_movementVector vectorDotProduct _side) * _terrainGradient;
    if (_upGradient > -0.1) then {
        _terrainFactor = (2 * _sideGradient) + 0.075 + 3.00 * abs(_upGradient + 0.1);
    } else {
        _terrainFactor = (2 * _sideGradient) + 0.075 + 0.55 * abs(_upGradient + 0.1);
    };
};

if (_movementSpeed > 2) then {
    (
        2.10 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + (SIM_BODYMASS + _gearMass) * (0.90 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainFactor * GVAR(terrainGradientFactor))
    ) * 0.23 * _duty
} else {
    (
        1.05 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + (SIM_BODYMASS + _gearMass) * (1.15 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainFactor * GVAR(terrainGradientFactor))
    ) * 0.23 * _duty
};
