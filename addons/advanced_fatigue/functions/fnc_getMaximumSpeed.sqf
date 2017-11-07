/*
 * Author: BaerMitUmlaut, Ruthberg
 * Calculates the current maximum movement speed for a unit.
 * Calculation is done according to the Pandolf/Wojtowicz formulas.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Power <NUMBER>
 * 2: Forward Angle <NUMBER>
 * 3: Side Angle <NUMBER>
 *
 * Return Value:
 * Speed <NUMBER>
 *
 * Example:
 * [player, 840, 0, 0] call ace_advanced_fatigue_fnc_getMaximumSpeed
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_power", "_fwdAngle", "_sideAngle"];

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

private _fnc_getRunningSpeed = {
    params ["_power", "_gearMass", "_terrainFactor", "_terrainGradient", "_duty"];
    private _p = _power / 0.23;
    _p = _p - 2.10 * SIM_BODYMASS;
    _p = _p - 4 * (SIM_BODYMASS + _gearMass) * (_gearMass / SIM_BODYMASS) ^ 2;
    _p = _p / (_terrainFactor * (SIM_BODYMASS + _gearMass));
    (1 / 30 * (-11 * _terrainGradient + sqrt(121 * (_terrainGradient ^ 2) + 1000 * _p)))
};

private _fnc_getWalkingSpeed = {
    params ["_power", "_gearMass", "_terrainFactor", "_terrainGradient", "_duty"];
    private _p = _power / 0.23;
    _p = _p - 1.05 * SIM_BODYMASS;
    _p = _p - 2 * (SIM_BODYMASS + _gearMass) * (_gearMass / SIM_BODYMASS) ^ 2;
    _p = _p / (_terrainFactor * (SIM_BODYMASS + _gearMass));
    (1 / 115 * (-33 * _terrainGradient + sqrt(1089 * (_terrainGradient ^ 2) + 11500 * _p)))
};

/*
private _fnc_getRunningSpeed = {
    params ["_power", "_gearMass", "_terrainFactor", "_terrainGradient", "_duty"];
    private _numerator = 3.6 * - (_power / (0.23 * _duty));
    _numerator = _numerator - 2.1 * SIM_BODYMASS;
    _numerator = _numerator - 4 * (_gearMass + SIM_BODYMASS) * (_gearMass / SIM_BODYMASS) ^ 2;
    private _denominator = _terrainFactor * (_gearMass + SIM_BODYMASS);
    private _radicand = ((0.66 * _terrainGradient) ^ 2) - _numerator / _denominator;
    private _v = -0.66 * _terrainGradient + sqrt(_radicand);
    _v / 1.8
};

private _fnc_getWalkingSpeed = {
    params ["_power", "_gearMass", "_terrainFactor", "_terrainGradient", "_duty"];
    private _numerator = 4.6 * - (_power / (0.23 * _duty));
    _numerator = _numerator - 1.05 * SIM_BODYMASS;
    _numerator = _numerator - 2 * (_gearMass + SIM_BODYMASS) * (_gearMass / SIM_BODYMASS) ^ 2;
    private _denominator = _terrainFactor * (_gearMass + SIM_BODYMASS);
    private _radicand = ((0.66 * _terrainGradient) ^ 2) - _numerator / _denominator;
    private _v = -0.66 * _terrainGradient + sqrt(_radicand);
    _v / 2.3
};
*/

private _speed = [_power, _gearMass, _terrainFactor, _terrainGradient, _duty] call _fnc_getRunningSpeed;
if (_speed < 2) then {
    _speed = [_power, _gearMass, _terrainFactor, _terrainGradient, _duty] call _fnc_getWalkingSpeed;
};

_speed
