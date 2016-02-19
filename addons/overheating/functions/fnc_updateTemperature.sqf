/*
 * Author: esteldunedain
 * Update temperature of a weapon.
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Heat increment (J) <NUMBER>
 *
 * Return value:
 * Current temperature <NUMBER>
 *
 * Example:
 * [player, currentWeapon player, 2000] call ace_overheating_fnc_updateTemperature
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "_heatIncrement"];
TRACE_3("params",_unit,_weapon,_heatIncrement);

// get old values
// each weapon has it's own variable. Can't store the temperature in the weapon since they are not objects unfortunately.
private _tempVarName = format [QGVAR(%1_temp), _weapon];
private _timeVarName = format [QGVAR(%1_time), _weapon];
private _temperature = _unit getVariable [_tempVarName, 0];
private _lastTime = _unit getVariable [_timeVarName, 0];

private _barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

_fnc_cooling = {
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
};

// Calculate cooling
_temperature = [_temperature, _barrelMass, ACE_time - _lastTime] call _fnc_cooling;
TRACE_1("cooledTo",_temperature);
// Calculate heating
// Steel Heat Capacity = 466 J/(Kg.K)
_temperature = _temperature + _heatIncrement / (_barrelMass * 466);

// Publish the temperature variable
[_unit, _tempVarName, _temperature, TEMP_TOLERANCE] call EFUNC(common,setApproximateVariablePublic);
// Store the update time locally
_unit setVariable [_timeVarName, ACE_time];

_temperature
