#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Returns the image of a value on a linear piecewise function defined by given points
 * Force integer causes decimals to be rounded up or down by chance based on their decimal part, i.e. 2.7 has a 70% chance to return 3 and 30% to return 2
 *
 * Arguments:
 * 0: Input value <NUMBER>
 * 1: Function points, must be in descending order by X (input) value <ARRAY>
 * 2: Whether to force integer <BOOLEAN>
 *
 * ReturnValue:
 * Interpolated result <NUMBER>
 *
 * Example:
 * [0.2, [[1,0], [0.5,1], [0,0]]] call ace_medical_damage_fnc_interpolatePoints
 *
 * Public: No
 */
params ["_input", "_points", ["_randomRound", false]];

if (count _points < 1) exitwith {
	//TODO: sensible default/error value
	0
};
if (count _points == 1) exitwith {_points select 0 select 1};

private _output = 0;
private _lower = _points findIf {(_x select 0) < _input};
if (_lower == 0) exitwith {_points select 0 select 1};
if (_lower == -1) exitwith {_points select (count _points - 1) select 1};
private _upper = _points select (_lower-1);
_lower = _points select _lower;
_output = linearConversion [_lower select 0, _upper select 0, _input, _lower select 1, _upper select 1, true];

if (_randomRound) then {
	_chanceCeil = _output - floor _output;
	if (_chanceCeil > random 1) then {
		_output = ceil _output;
	} else {
		_output = floor _output;
	};
};

_output //return
