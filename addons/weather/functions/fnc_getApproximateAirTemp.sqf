#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Returns an approximate representation of temperature at a unit's location.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_weather_fnc_getApproximateAirTemp
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("params",_unit);

if (isNil (format ["%1", _unit getVariable "ACE_airTemperatureBias"])) then {
    _unit setVariable ["ACE_airTemperatureBias", [-(random(3) + 1), random(3) + 1]];
};

private _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
private _humidity = EGVAR(weather,currentHumidity);
private _heatIndex = [_temperature, _humidity] call EFUNC(weather,calculateHeatIndex);
private _chill = [_temperature, _humidity] call EFUNC(weather,calculateWindChill);

private _e = 2^(1/(ln 2));

/*
// Windchill calc with wind vars; https://en.wikipedia.org/wiki/Wind_chill#Australian_Apparent_Temperature
private _windspeed = [getPosASL _unit, true, true, true] call EFUNC(weather,calculateWindSpeed);
private _water_vapor_pressure = _humidity * 6.105 *(_e ^ ((17.27 * _temperature)/(237.7 + _temperature))) / 100;
private _chill = _temperature + (0.33 * _water_vapor_pressure) - (0.70 * _windspeed) - 400;
*/

// sigmoid = f(x) = L / (1 + e^(-k * (x - x_0)));
// L max value, e = euler, k = steepness,

// L = max value
private _sigmoid_L = 1;

// x_0 = sigmoid midpoint, aka 50% proportion; 18.5C, ~65F
private _sigmoid_midpoint = 18.5;

// place +- midpoint with desired proportion
private _sigmoid_valuation = 8.5;

// desired upper and proportion on sigmoid
private _sigmoid_proportion_at_valuation = 0.95;
private _sigmoid_proportion_at_lower_valuation = 1 - _sigmoid_proportion_at_valuation;

// k = steepness
private _sigmoid_k = (ln ((_sigmoid_proportion_at_lower_valuation^-1) - 1) ) / _sigmoid_valuation;

// 5$/95% @ 10C/27C; [5% and 95% values at 50F and ~80F];
// 5% = 0.05 = 1/20 = f(_midpoint - _valuation) = L / (1 + e^(-k * ((_midpoint - _valuation) - _midpoint)
// (0.05)^-1 = 20 = (L / (1 + e^(-k * (-_valuation))) )^-1 = (1 + e^(-k * -_valuation))/L;
// L = 1;> 20 = (1 + e^(k * valuation)); 20 - 1 = e^(k * valuation);
// 19 = e^(k * 8.5); (log_e 19) = (k * 8.5); (log_e 19)/8.5 = k;

// retrieve sigmoid proportion at _temperature
private _temperature_sigmoid = _sigmoid_L / (1 + _e^(-_sigmoid_k * (_temperature - _sigmoid_midpoint)));

// Weighted average between windchill and heat index based on sigmoid levels, plus +- 4deg randomisation
private _apparent_temperature = ((_temperature_sigmoid * _heatIndex) + ((1 - _temperature_sigmoid) * _chill) + random(8) - 4);

[_apparent_temperature, (_unit getVariable "ACE_airTemperatureBias")] call FUNC(displayAirTemp);
