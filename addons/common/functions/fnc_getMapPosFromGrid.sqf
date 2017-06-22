/*
 * Author: PabstMirror
 * Gets position from grid cords
 *
 * Arguments:
 * 0: Grid Cords <STRING>
 * 1: Grid center (true), Grid Bottom Right (false) (default: true) <BOOL>
 *
 * Return Value:
 * Position <ARRAY>
 *
 * Example:
 * ["6900080085"] call ace_common_fnc_getMapPosFromGrid
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_inputString", ["_getCenterOfGrid", true]];

if (count GVAR(mapGridData) == 0) exitWith {
    ERROR("Map has bad data, falling back to BIS_fnc_gridToPos");
    (_this call BIS_fnc_gridToPos) select 0
};

GVAR(mapGridData) params ["_offsetX", "_realOffsetY", "_stepXat5", "_stepYat5"];

private _countInput = count _inputString;
private _countInputHalf = floor (_countInput / 2);

//Split string, ignoring middle
private _xPart = _inputString select [0, _countInputHalf];
private _yPart = _inputString select [ceil (_countInput / 2), _countInputHalf];

private _xPos = ((parseNumber _xPart) * _stepXat5 * 10 ^ (5 - _countInputHalf)) + _offsetX;
private _yPos = ((parseNumber _yPart) * _stepYat5 * 10 ^ (5 - _countInputHalf)) + _realOffsetY;

if (_getCenterOfGrid) then {
    _xPos = _xPos + 0.5 * _stepXat5 * 10 ^ (5 - _countInputHalf);
    _yPos = _yPos + 0.5 * _stepYat5 * 10 ^ (5 - _countInputHalf);
};

[_xPos, _yPos, 0]
