/*
 * Author: PabstMirror
 * Gets position from grid cords
 *
 * Argument:
 * 0: Grid Cords <STRING>
 *
 * Return values:
 * 0: Position <ARRAY>
 *
 * Example:
 * ["6900080085"] call ace_map_fnc_getMapPosFromGrid
 *
 * Public: Yes
 */

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_inputString);
DEFAULT_PARAM(1,_getCenterOfGrid,true);

EXPLODE_4_PVT(GVAR(mapGridData),_offsetX,_realOffsetY,_stepXat5,_stepYat5);

_countInput = count _inputString;
_countInputHalf = floor (_countInput / 2);

//Split string, ignoring middle
_xPart = _inputString select [0, _countInputHalf];
_yPart = _inputString select [(ceil (_countInput / 2)), _countInputHalf];

_xPos = ((parseNumber _xPart) * _stepXat5 * 10 ^ (5 - _countInputHalf)) + _offsetX;
_yPos = ((parseNumber _yPart) * _stepYat5 * 10 ^ (5 - _countInputHalf)) + _realOffsetY;

if (_getCenterOfGrid) then {
    _xPos = _xPos + 0.5 * _stepXat5 * 10 ^ (5 - _countInputHalf);
    _yPos = _yPos + 0.5 * _stepYat5 * 10 ^ (5 - _countInputHalf);
};

[_xPos, _yPos, 0];
