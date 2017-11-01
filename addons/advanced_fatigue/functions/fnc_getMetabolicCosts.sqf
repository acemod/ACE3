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

#ifdef DEBUG_MODE_FULL
onEachFrame {
    private _normal = surfaceNormal (getPosWorld player);
    private _beg = (getPosWorld player) vectorAdd (_normal vectorMultiply 0.5);
    private _end = _beg vectorAdd (_normal vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,1,0,1]];

    private _side = vectorNormalized (_normal vectorCrossProduct [0, 0, 1]);
    private _end = _beg vectorAdd (_side vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,0,1,1]];

    private _up = vectorNormalized (_normal vectorCrossProduct _side);
    private _end = _beg vectorAdd (_up vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1,0,0,1]];

    private _movementVector = vectorNormalized (velocity player);
    private _end = _beg vectorAdd (_movementVector vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [1,1,0,1]];

    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    _sideVector set[2, 0];
    private _end = _beg vectorAdd (_sideVector vectorMultiply 2.0);
    drawLine3D [ASLToATL _beg, ASLToATL _end, [0,1,1,1]];
};
#endif

if (!GVAR(isSwimming)) then {
    private _normal = surfaceNormal (getPosWorld _unit);
    private _movementVector = vectorNormalized (velocity _unit);
    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    private _fwdAngle = asin (_movementVector select 2);
    private _sideAngle = abs (asin (_sideVector select 2));
    private _fwdGradient = (_fwdAngle / 45) min 1;
    private _sideGradient = (_sideAngle / 45) min 1;
    if (_fwdGradient > -0.1) then {
        _terrainFactor = 5 * (_sideGradient + (0.75 + 30.0 * abs (_fwdGradient+0.1)) / 20);
    } else {
        _terrainFactor = 5 * (_sideGradient + (0.75 + 5.50 * abs (_fwdGradient+0.1)) / 20);
    };
#ifdef DEBUG_MODE_FULL
    private _terrainAngle = asin (1 - ((surfaceNormal getPosWorld player) select 2));
    private _terrainGradient = (_terrainAngle / 45 min 1) * 5 * GVAR(terrainGradientFactor);
    hintSilent format["FwdAngle: %1 | SideAngle: %2 \n Baer -> Angle: %3 | Gradient: %4 | Impact: %5 \n Ulteq -> FwdGradient: %6 | SideGradient: %7 | Impact: %8", _fwdAngle toFixed 1, _sideAngle toFixed 1, _terrainAngle toFixed 2, _terrainGradient toFixed 2, 0.66 * _movementSpeed * 5 * _terrainGradient toFixed 2, _fwdGradient toFixed 2, _sideGradient toFixed 2, 0.66 * _movementSpeed * _terrainFactor toFixed 2];
#endif
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
