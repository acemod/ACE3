/*
 * Author: LorenLuke
 * Displays an abstracted depiction of air temperature to a unit.
 *
 * Arguments:
 * 0: Temperature <NUMBER>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [15.8] call ace_advanced_ballistics_fnc_displayAirTemp
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_apparent_temperature"];
TRACE_1("params",_temperature);

private _string = "  -40C "; //extra spaces to balance zero point to be middle
private _text = [_string, [0.1,0.4,1]] call EFUNC(common,stringToColoredText);
private _color = [0.5, 0.5, 0.5];

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

[_text, QPATHTOF(UI\temp_ca.paa),[1,1,1], ACE_player, 2] call EFUNC(common,displayTextPicture);