/*
 * Author: VKing
 *
 * Gets a 10-digit map grid for the given world position
 *
 * Argument:
 * 0: Position (2D Position)
 *
 * Return value:
 * Easting and Northing as strings (Array)
 */

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

private "_pos";
_pos = getPos player;
TRACE_1("",_pos);
// PARAMS_1(_pos);

private ["_posX","_posY","_northingReversed","_mapsize","_originGrid","_originArray","_length","_offsetX","_offsetY","_gridX","_gridY"];

// _northingReversed = [] call CBA_fnc_northingReversed;
_northingReversed = false;
if(isNil "cba_common_mapReversed") then {
	_test = getNumber (configFile >> "CfgWorlds" >> worldName >> "Grid" >> "Zoom1" >> "stepY");
	if(_test > 0) then {
		_northingReversed = true;
	};
	cba_common_mapReversed = _northingReversed;
} else {
	_northingReversed = cba_common_mapReversed;
};

_mapsize = [] call bis_fnc_mapSize;
TRACE_2("",_northingReversed,_mapsize);

if (_northingReversed) then {
    _originGrid = mapGridPosition [0,_mapsize,0];
} else {
    _originGrid = mapGridPosition [0,0,0];
};
// _originGrid = "1234567890";
TRACE_1("",_originGrid);

if (count _originGrid == 10) exitWith {
    TRACE_1("",mapGridPosition _pos);
    [mapGridPosition _pos select [0,5], mapGridPosition _pos select [5,5]]
};

_originArray = toArray _originGrid;
_length = (count _originArray);
_length = _length/2;

_offsetX = parseNumber (toString (_originArray select [0,_length]));
_offsetY = parseNumber (toString (_originArray select [_length,_length]));
TRACE_2("",_offsetX,_offsetY);

TRACE_2("",_pos select 0, _pos select 1);

_posX = ceil(_pos select 0) + _offsetX;
if (_posX < 0) then {_posX = 100000 + _posX};
TRACE_1("",_posX);
_posX = format ["%1",_posX];
if (_northingReversed) then {
    _posY = _mapSize - ceil(_pos select 1) + _offsetY -100;
} else {
    _posY = ceil(_pos select 1) + _offsetY;
};
TRACE_1("",_posY);
if (_posY < 0) then {_posY = 100000 + _posY};
_posY = format["%1",_posY];
TRACE_2("",_posX,_posY);

switch (count _posX) do {
    case 1: {_posX = "0000"+_posX};
    case 2: {_posX = "000"+_posX};
    case 3: {_posX = "00"+_posX};
    case 4: {_posX = "0"+_posX};
    default {};
};
switch (count _posY) do {
    case 1: {_posY = "0000"+_posY};
    case 2: {_posY = "000"+_posY};
    case 3: {_posY = "00"+_posY};
    case 4: {_posY = "0"+_posY};
    default {};
};
TRACE_3("",mapGridPosition _pos,_posX,_posY);

[_posX,_posY]