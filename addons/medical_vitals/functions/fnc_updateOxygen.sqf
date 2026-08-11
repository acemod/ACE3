#include "..\script_component.hpp"
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

if (!GVAR(simulateSpO2)) exitWith {}; // changing back to default is handled in initSettings.inc.sqf

#define IDEAL_PPO2 0.255

private _current = GET_SPO2(_unit);
private _heartRate = GET_HEART_RATE(_unit);

private _altitude = EGVAR(common,mapAltitude) + ((getPosASL _unit) select 2);
private _po2 = if (missionNamespace getVariable [QEGVAR(weather,enabled), false]) then {
    private _temperature = _altitude call EFUNC(weather,calculateTemperatureAtHeight);
    private _pressure = _altitude call EFUNC(weather,calculateBarometricPressure);
    [_temperature, _pressure, EGVAR(weather,currentHumidity)] call EFUNC(weather,calculateOxygenDensity)
} else {
    // Rough approximation of the partial pressure of oxygen in the air
    0.25725 * (_altitude / 1000 + 1)
};

private _oxygenSaturation = (IDEAL_PPO2 min _po2) / IDEAL_PPO2;

// Check gear for oxygen supply
[goggles _unit, headgear _unit, vest _unit] findIf {
    _x in GVAR(oxygenSupplyConditionCache) &&
    {ACE_player call (GVAR(oxygenSupplyConditionCache) get _x)} &&
    { // Will only run this if other conditions are met due to lazy eval
        _oxygenSaturation = 1;
        _po2 = IDEAL_PPO2;
        true
    }
};

// Base oxygen consumption rate
private _negativeChange = BASE_OXYGEN_USE;

// Fatigue & exercise will demand more oxygen
// Assuming a trained male in midst of peak exercise will have a peak heart rate of ~180 BPM
// Ref: https://academic.oup.com/bjaed/article-pdf/4/6/185/894114/mkh050.pdf table 2, though we don't take stroke volume change into account
if (_unit == ACE_player && {missionNamespace getVariable [QEGVAR(advanced_fatigue,enabled), false]}) then {
    _negativeChange = _negativeChange - ((1 - EGVAR(advanced_fatigue,aeReservePercentage)) * 0.1) - ((1 - EGVAR(advanced_fatigue,anReservePercentage)) * 0.05);
};

// Effectiveness of capturing oxygen
// increases slightly as po2 starts lowering
// but falls off quickly as po2 drops further
private _capture = 1 max ((_po2 / IDEAL_PPO2) ^ (-_po2 * 3));
private _positiveChange = _heartRate * 0.00368 * _oxygenSaturation * _capture;

private _breathingEffectiveness = 1;
{
    _breathingEffectiveness = if (_y isEqualType 0) then {
        _breathingEffectiveness * _y
    } else {
        _breathingEffectiveness * (_unit call _y)
    };
} forEach GVAR(spo2DutyList);

private _rateOfChange = _negativeChange + (_positiveChange * _breathingEffectiveness);

private _spo2 = (_current + (_rateOfChange * _deltaT)) max 0 min 100;

_unit setVariable [VAR_OXYGEN_DEMAND, _negativeChange - BASE_OXYGEN_USE];
_unit setVariable [VAR_SPO2, _spo2, _syncValue];
