/*
 * Author: esteldunedain
 * Calculate the cooling down of a weapon over a time interval.
 *
 * Arguments:
 * 0: Initial temperature <NUMBER>
 * 1: Barrel mass <NUMBER>
 * 2: Time interval  <NUMBER>
 *
 * Return Value:
 * Final temperature <NUMBER>
 *
 * Example:
 * [_temperature, _barrelMass, _totalTime] call ace_overheating_fnc_calculateCooling
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_temperature", "_barrelMass", "_totalTime"];

// If a long time passed since the last shot, there's no need to calculate anything; the weapon should be cool
if (_totalTime > 1800) exitWith {0};

//AR-15 (0.00570m bullet diameter) (barrel diameter usually 0.75" or 0.008255m radius)
//Steel Denisty = 7850 m^3 / kg
//Area of a cylinder (2/r)*(Pi * r^3 + V) - for a 0.008255m radius barrel -> Area = 210(1/meters) * Volume
//Adjusted volume for being hollowed out is ~1.1x
//So Area = 210 * 1.1 * (mass / 7850) = mass * 0.029427 (for steel near that diameter)

private _barrelSurface = _barrelMass * 0.029427;

TRACE_4("cooling",_temperature,_totalTime,_barrelMass,_barrelSurface);

private _time = 0;
while {true} do {
    private _deltaTime = (_totalTime - _time) min 20;

    _temperature = _temperature - (
    // Convective cooling
    25 * _barrelSurface * _temperature
    // Radiative cooling
    + 0.4 * 5.67e-8 * _barrelSurface *
    ( (_temperature + 273.15)*(_temperature + 273.15)
    * (_temperature + 273.15)*(_temperature + 273.15)
    - 273.15 * 273.15 * 273.15 *273.15 )
    ) * _deltaTime / (_barrelMass * 466);

    if (_temperature < 1) exitWith {0};

    if (isNil "_temperature") exitWith {
        diag_log text format ["[ACE] ERROR: _totalTime = %1; _time = %2; _deltaTime = %3;", _totalTime, _time, _deltaTime];
        0
    };

    _time = _time + _deltaTime;
    if (_time >= _totalTime) exitWith { _temperature max 0 };
};
