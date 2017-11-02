/*
 * Author: BaerMitUmlaut
 * Calculates the current metabolic costs for a unit.
 * Calculation is done according to the Pandolf/Wojtowicz formulas.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Speed <NUMBER>
 * 2: Forward Angle <NUMBER>
 * 3: Side Angle <NUMBER>
 *
 * Return Value:
 * Metabolic cost <NUMBER>
 *
 * Example:
 * [player, 3.3, 0, 0] call ace_advanced_fatigue_fnc_getMetabolicCosts
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_movementSpeed", "_fwdAngle", "_sideAngle"];

private _gearMass = ((_unit getVariable [QEGVAR(movement,totalLoad), loadAbs _unit]) / 22.046) * GVAR(loadFactor);
private _terrainGradient = 1;
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
    if (_fwdAngle < 0) then {
        _terrainGradient = 0.15 * abs(_fwdAngle);
    } else {
        _terrainGradient = _fwdAngle;
    };
    if ((getPosATL _unit) select 2 < 0.01) then {
        private _sideGradient = abs(_sideAngle / 45) min 1;
        _terrainFactor = 1 + _sideGradient ^ 2;
    };
#ifdef DEBUG_MODE_FULL
    // TODO: Remove this once we're convinced of the new method
    private _terrainAngleBaer = asin (1 - ((surfaceNormal getPosWorld player) select 2));
    private _terrainGradientBaer = (_terrainAngleBaer / 45 min 1) * 5 * GVAR(terrainGradientFactor);
    private _impactBaer = (SIM_BODYMASS + _gearMass) * (0.90 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainGradientBaer);
    private _impactUlteq = _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.90 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainGradient);
    hintSilent format["FwdAngle: %1 | SideAngle: %2 \n Baer -> Angle: %3 | Gradient: %4 | Impact: %5 \n Ulteq -> Impact: %6", _fwdAngle toFixed 1, _sideAngle toFixed 1, _terrainAngleBaer toFixed 2, _terrainGradientBaer toFixed 2, _impactBaer toFixed 2, _impactUlteq toFixed 2];
#endif
};

if (_movementSpeed > 2) then {
    (
        2.10 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.90 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainGradient)
    ) * 0.23 * _duty
} else {
    (
        1.05 * SIM_BODYMASS
        + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2)
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_movementSpeed ^ 2) + 0.66 * _movementSpeed * _terrainGradient)
    ) * 0.23 * _duty
};
