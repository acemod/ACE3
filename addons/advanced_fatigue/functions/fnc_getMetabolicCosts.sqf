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
    private _normal = surfaceNormal (getPosASL _unit);
    private _movementVector = vectorNormalized (velocity _unit);
    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    private _fwdAngle = asin (_movementVector select 2);
    private _sideAngle = asin (_sideVector select 2);
    private _fwdGradient = (_fwdAngle / 45) min 1;
    private _sideGradient = (_sideAngle / 45) min 1;
    if (_fwdGradient > -0.1) then {
        _terrainFactor = _sideGradient + (0.75 + 30.0 * abs (_fwdGradient+0.1)) / 20;
    } else {
        _terrainFactor = _sideGradient + (0.75 + 5.50 * abs (_fwdGradient+0.1)) / 20;
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
