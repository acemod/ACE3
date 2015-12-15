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

// each weapon has it's own variable. Can't store the temperature in the weapon since they are not objects unfortunately.
private _variableName = format [QGVAR(%1), _weapon];

// get old values
(_unit getVariable [_variableName, [0, 0]]) params ["_temperature", "_time"];

private _barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

_fnc_cooling = {
    params ["_temperature", "_barrelMass", "_totalTime"];
    TRACE_3("cooling",_temperature,_barrelMass,_totalTime);

    // If a long time passed since the last shot, there's no need to calculate anything; the weapon should be cool
    if (_totalTime > 1800) exitWith {0};

    private _barrelSurface = _barrelMass / 7850 / 0.003;

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
_temperature = [_temperature, _barrelMass, ACE_time - _time] call _fnc_cooling;
TRACE_1("cooledTo",_temperature);
// Calculate heating
// Steel Heat Capacity = 466 J/(Kg.K)
_temperature = _temperature + _heatIncrement / (_barrelMass * 466);

// Publish the variable
[_unit, _variableName, [_temperature, ACE_time], 2.0] call EFUNC(common,setVariablePublic);

_temperature
