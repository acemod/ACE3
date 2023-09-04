#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Update the oxygen levels
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Sync value? <BOOL>
 *
 * ReturnValue:
 * Current SPO2 <NUMBER>
 *
 * Example:
 * [player, 1, false] call ace_medical_vitals_fnc_updateOxygen
 *
 * Public: No
 */

params ["_unit", "_deltaT", "_syncValue"];

#define IDEAL_PPO2 0.255

private _current = GET_SPO2(_unit);
private _heartRate = GET_HEART_RATE(_unit);

private _altitude = (getPosASL _unit) select 2;
private _po2 = if (missionNamespace getVariable ["ace_weather", false]) then {
    private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
    private _pressure = _altitude call EFUNC(weather,calculateBarometricPressure);
    [_temperature, _pressure, EGVAR(weather,currentHumidity)] call EFUNC(weather,calculateOxygenDensity)
} else {
    // Rough approximation of the partial pressure of oxygen in the air
    0.25725 * (_altitude / 1000 + 1)
};

private _oxygenSaturation = (IDEAL_PPO2 min _po2) / IDEAL_PPO2;

// Check gear for oxygen supply
[goggles _unit, headgear _unit] findIf {
    if (_x != "") then {
        private _condition = getText (configFile >> "CfgWeapons" >> _x >> QGVAR(oxygenSupply));
        if (_condition != "" && {ace_player call compile _condition}) then {
            _oxygenSaturation = 1;
            _po2 = IDEAL_PPO2;
            true
        } else {
            false
        }
    } else {
        false
    }
};

// Base oxygen consumption rate
private _negativeChange = BASE_OXYGEN_USE;

// Fatigue will demand more oxygen
if (missionNamespace getVariable [QEGVAR(advanced_fatigue,enabled), false]) then {
    _negativeChange = _negativeChange - ((1 - EGVAR(advanced_fatigue,aeReservePercentage)) * 0.5);
};

// Effectiveness of capturing oxygen
// increases slightly as po2 starts lowering
// but falls off quickly as po2 drops further
private _capture = 1 max ((_po2 / IDEAL_PPO2) ^ (-_po2 * 0.2));
private _positiveChange = _heartRate * 0.00368 * _oxygenSaturation * _capture;

private _breathingEffectiveness = 1;

private _rateOfChange = _negativeChange + (_positiveChange * _breathingEffectiveness);

// We want to compensate even further when spo2 is dropping
if (_rateOfChange < 0) then {
    _negativeChange + _rateOfChange
};

private _spo2 = _current + (_rateOfChange * _deltaT);
_spo2 = _spo2 max 0;
_spo2 = _spo2 min 100;

_unit setVariable [QGVAR(oxygenDemand), _negativeChange - BASE_OXYGEN_USE];
_unit setVariable [VAR_SPO2, _spo2, _syncValue];
