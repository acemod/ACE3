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
params ["_unit", "_speed", "_fwdAngle", "_sideAngle"];

private _gearMass = 0 max (((_unit getVariable [QEGVAR(movement,totalLoad), loadAbs _unit]) / 22.046 - 3.5) * GVAR(loadFactor));
private _terrainGradient = abs(_fwdAngle);
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
        _terrainGradient = 0.15 * _terrainGradient;
    };
    if ((getPosATL _unit) select 2 < 0.01) then {
        private _sideGradient = abs(_sideAngle / 45) min 1;
        _terrainFactor = 1 + _sideGradient ^ 4;
    };
};

if (_speed > 2) then {
#ifdef DEBUG_MODE_FULL
    private _baseline = 2.10 * SIM_BODYMASS + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + (SIM_BODYMASS + _gearMass) * 0.90 * (_speed ^ 2);
    private _graded = 2.10 * SIM_BODYMASS + 4 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.90 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient);
    private _terrainImpact = abs((_graded / _baseline) - 1);
    hintSilent format["FwdAngle: %1 | SideAngle: %2 \n TerrainFactor: %3 | TerrainGradient: %4 \n TerrainImpact: %5 \n Speed: %6 | CarriedLoad: %7 \n Duty: %8 | Work: %9", _fwdAngle toFixed 1, _sideAngle toFixed 1, _terrainFactor toFixed 2, _terrainGradient toFixed 1, _terrainImpact toFixed 2, _speed toFixed 2, _gearMass toFixed 1, _duty toFixed 2, round(_graded * BIOMECH_EFFICIENCY * _duty)];
#endif
    (
        2.10 * SIM_BODYMASS
        + 4 * (SIM_BODYMASS + _gearMass) * (_gearMass / SIM_BODYMASS) ^ 2
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (0.90 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
} else {
#ifdef DEBUG_MODE_FULL
    private _baseline = 1.05 * SIM_BODYMASS + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + (SIM_BODYMASS + _gearMass) * 1.15 * (_speed ^ 2);
    private _graded = 1.05 * SIM_BODYMASS + 2 * (SIM_BODYMASS + _gearMass) * ((_gearMass / SIM_BODYMASS) ^ 2) + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient);
    private _terrainImpact = abs((_graded / _baseline) - 1);
    hintSilent format["FwdAngle: %1 | SideAngle: %2 \n TerrainFactor: %3 | TerrainGradient: %4 \n TerrainImpact: %5 \n Speed: %6 | CarriedLoad: %7 \n Duty: %8 | Work: %9", _fwdAngle toFixed 1, _sideAngle toFixed 1, _terrainFactor toFixed 2, _terrainGradient toFixed 1, _terrainImpact toFixed 2, _speed toFixed 2, _gearMass toFixed 1, _duty toFixed 2, round(_graded * BIOMECH_EFFICIENCY * _duty)];
#endif
    (
        1.05 * SIM_BODYMASS
        + 2 * (SIM_BODYMASS + _gearMass) * (_gearMass / SIM_BODYMASS) ^ 2
        + _terrainFactor * (SIM_BODYMASS + _gearMass) * (1.15 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
};
