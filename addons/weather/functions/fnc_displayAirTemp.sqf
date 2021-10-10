#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Displays an abstracted depiction of air temperature to a unit.
 *
 * Arguments:
 * 0: Temperature <NUMBER>
 * 1: Unit Bias range <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [15.8] call ace_weather_fnc_displayAirTemp
 *
 * Public: No
 */

params ["_apparent_temperature", "_bias"];
TRACE_2("params",_temperature, _bias);

_temperature1 = floor(_temperature + (_bias select 0) - (random 2));
_temperature2 = floor(_temperature + (_bias select 1) + (random 2));

private _color1 = [
// Colors obtained by quartic regression formula of RGB values at corresponding temperatures as marked on advanced_ballistics rangecard
    ( (((-0.000238348 * (_temperature1 ^ 4)) - (0.00865642 * (_temperature1 ^ 3)) + (0.794548 * (_temperature1 ^2)) - (0.323314 * _temperature1) +6.78445) min 255) /255) max 0,
    ( (((-0.000308515 * (_temperature1 ^ 4)) + (0.000245732 * (_temperature1 ^ 3)) + (0.308531 * (_temperature1 ^2)) - (02.78916 * _temperature1) +164.326) min 255) /255) max 0,
    ( (((-0.000107648 * (_temperature1 ^ 4)) + (0.00106365 * (_temperature1 ^ 3)) - (0.0989707 * (_temperature1 ^2)) - (9.66256 * _temperature1) +171.402) min 255) /255) max 0
];

private _text = composeText ["", [format ["%1C", _temperature1],_color1] call EFUNC(common,stringToColoredText)];
_text = composeText [_text, ["  ---  ", [1,1,1]] call EFUNC(common,stringToColoredText)];

private _color2 = [
// Colors obtained by quartic regression formula of RGB values at corresponding temperatures as marked on advanced_ballistics rangecard
    ( (((-0.000238348 * (_temperature2 ^ 4)) - (0.00865642 * (_temperature2 ^ 3)) + (0.794548 * (_temperature2 ^2)) - (0.323314 * _temperature2) +6.78445) min 255) /255) max 0,
    ( (((-0.000308515 * (_temperature2 ^ 4)) + (0.000245732 * (_temperature2 ^ 3)) + (0.308531 * (_temperature2 ^2)) - (02.78916 * _temperature2) +164.326) min 255) /255) max 0,
    ( (((-0.000107648 * (_temperature2 ^ 4)) + (0.00106365 * (_temperature2 ^ 3)) - (0.0989707 * (_temperature2 ^2)) - (9.66256 * _temperature2) +171.402) min 255) /255) max 0
];

 _text = composeText [_text, [format ["%1C", _temperature2], _color2] call EFUNC(common,stringToColoredText)];

[_text, QPATHTOF(UI\temp_ca.paa),_color, ACE_player, 2] call EFUNC(common,displayTextPicture);

/*
for "_i" from -40 to 40 step 4 do {
    _temp_color = _color;

    if (_i == 0) then {
        _text = composeText [_text, ["[", _temp_color] call EFUNC(common,stringToColoredText)];
        _text = composeText [_text, ["0", [0.6, 1, 0.6]] call EFUNC(common,stringToColoredText)];
        _text = composeText [_text, ["]", _temp_color] call EFUNC(common,stringToColoredText)];
    } else {
        _string = "I";
    };

    if (abs( _i - _apparent_temperature) < 8.5) then {
        _temp_color = [
        // Colors obtained by quartic regression formula of RGB values at corresponding temperatures as marked on advanced_ballistics rangecard
            ( (((-0.000238348 * (_i ^ 4)) - (0.00865642 * (_i ^ 3)) + (0.794548 * (_i ^2)) - (0.323314 * _i) +6.78445) min 255) /255) max 0,
            ( (((-0.000308515 * (_i ^ 4)) + (0.000245732 * (_i ^ 3)) + (0.308531 * (_i ^2)) - (02.78916 * _i) +164.326) min 255) /255) max 0,
            ( (((-0.000107648 * (_i ^ 4)) + (0.00106365 * (_i ^ 3)) - (0.0989707 * (_i ^2)) - (9.66256 * _i) +171.402) min 255) /255) max 0
        ];
    };

    _text = composeText [_text, [_string, [_temp_color select 0, _temp_color select 1, _temp_color select 2]] call EFUNC(common,stringToColoredText)];
};

_text = composeText [_text, [" +40C", [1,0,0]] call EFUNC(common,stringToColoredText)];
*/
[_text, QPATHTOF(UI\temp_ca.paa),[1,1,1], ACE_player, 2] call EFUNC(common,displayTextPicture);
