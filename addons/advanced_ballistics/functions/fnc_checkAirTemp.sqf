/*
 * Author: LorenLuke
 *
 * Returns an approximate representation of temperature graphically;
 *
 * Arguments:
 * 0: Unit- Man <OBJECT>
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_advanced_ballistics_fnc_checkAirTemp;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

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
// L max value, e = euler, k = steepness, x_0 = midpoint

// L = 1;
// x_0 = 18.5; ~65F
// 5$/95% @ 10C/27C; [5% and 95% values at 50F and ~80F];
// e^(-k(x - x_0) = 19;
// e^(-k(10 - 18.5) = 19;
// e^(-k * -8.5) = 19; (log_e 19) = (k * 8.5); (log_e 19)/8.5 = k;

private _sigmoid_valuation = 8.5;
private _sigmoid_proportion_at_valuation = 0.95;
private _sigmoid_proportion_at_lower_valuation = 1 - _sigmoid_proportion_at_valuation;
private _sigmoid_L = 1;
private _sigmoid_midpoint = 18.5;
private _sigmoid_k = (ln ((_sigmoid_proportion_at_lower_valuation^-1) - 1) )/ _sigmoid_valuation;
private _temperature_sigmoid = _sigmoid_L / (1 + _e ^ (-_sigmoid_k * (_temperature - _sigmoid_midpoint)));

// Weighted average between windchill and heat index based on sigmoid levels, plus +- 4deg randomisation
private _apparent_temperature = ((_temperature_sigmoid * _heatIndex) + ((1 - _temperature_sigmoid) * _chill) + random(8) - 4);

private _string = "  -40C "; //extra spaces to balance zero point to be middle

private _text = [_string, [0.1,0.4,1]] call EFUNC(common,stringToColoredText);
private _color = [0.5, 0.5, 0.5];


for [{_i=-40}, {_i <= 40}, {_i = _i + 4}] do {

    _temp_color = _color;
    if (( _i <= 0 && _i >= _apparent_temperature && _apparent_temperature <= 0) || ( _i >= 0 &&_i <= _apparent_temperature && _apparent_temperature >= 0) || abs(_i - _apparent_temperature) < 7) then {
        _temp_color = [
        //Colors obtained by quartic regression formula of RGB values at corresponding temperatures as marked on advanced_ballstics rangecard;
            ( (((-0.000238348 * (_i ^ 4)) - (0.00865642 * (_i ^ 3)) + (0.794548 * (_i ^2)) - (0.323314 * _i) +6.78445) min 255) /255) max 0,
            ( (((-0.000308515 * (_i ^ 4)) + (0.000245732 * (_i ^ 3)) + (0.308531 * (_i ^2)) - (02.78916 * _i) +164.326) min 255) /255) max 0,
            ( (((-0.000107648 * (_i ^ 4)) + (0.00106365 * (_i ^ 3)) - (0.0989707 * (_i ^2)) - (9.66256 * _i) +171.402) min 255) /255) max 0
        ];
    };

    if(_i == 0) then {
        _text = composeText [_text, ["[", [_temp_color select 0, _temp_color select 1, _temp_color select 2]] call EFUNC(common,stringToColoredText)];
        _text = composeText [_text, ["0", [0.6, 1, 0.6]] call EFUNC(common,stringToColoredText)];
        _text = composeText [_text, ["]", [_temp_color select 0, _temp_color select 1, _temp_color select 2]] call EFUNC(common,stringToColoredText)];
    } else {
        _string = "|";
    };

    _text = composeText [_text, [_string, [_temp_color select 0, _temp_color select 1, _temp_color select 2]] call EFUNC(common,stringToColoredText)];

};

_text = composeText [_text, [" +40C", [1,0,0]] call EFUNC(common,stringToColoredText)];

private _picture = QPATHTOEF(overheating,UI\temp_ca.paa);

[_text, _picture] call EFUNC(common,displayTextPicture);
