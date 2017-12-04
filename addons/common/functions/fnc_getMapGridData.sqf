/*
 * Author: PabstMirror
 * Finds real x/y offset and map step for a 10 digit grid
 * Save time by preparing data one time at startup
 * Ideas from Nou's mapGridToPos and BIS_fnc_gridToPos
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_map_fnc_getMapGridData
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(mapGridData) = [];

//--- Extract grid values from world config (Borrowed from BIS_fnc_gridToPos)
private _cfgGrid = configFile >> "CfgWorlds" >> worldName >> "Grid";
private _offsetX = getNumber (_cfgGrid >> "offsetX");
private _offsetY = getNumber (_cfgGrid >> "offsetY");
private _zoomMax = 1e99;
private _formatX = "";
private _formatY = "";
private _stepX = 1e10;
private _stepY = 1e10;

{
    private _zoom = getnumber (_x >> "zoomMax");
    if (_zoom < _zoomMax) then {
        _zoomMax = _zoom;
        _formatX = getText (_x >> "formatX");
        _formatY = getText (_x >> "formatY");
        _stepX = getNumber (_x >> "stepX");
        _stepY = getNumber (_x >> "stepY");
    };
    false
} count configProperties [_cfgGrid, "isClass _x", false];

private _letterGrid = false;

if (toLower _formatX find "a" != -1) then {_letterGrid = true};
if (toLower _formatY find "a" != -1) then {_letterGrid = true};

if (_letterGrid) exitWith {
    WARNING_3("Map Grid Warning (%1) - Map uses letter grids [%2, %3]",worldName,_formatX,_formatY);
};

//Start at [0, 500] and move north until we get a change in grid
private _heightOffset = 500;
private _startGrid = mapGridPosition [0, _heightOffset];
private _originGrid = _startGrid;

while {_startGrid == _originGrid} do {
    _heightOffset = _heightOffset + 1;
    _originGrid = mapGridPosition [0, _heightOffset];
};

//Calculate the real y offset
private _realOffsetY = (parseNumber (_originGrid select [count _formatX, count _formatY])) * _stepY + _heightOffset - 1;

//Calculate MGRS 10digit step - they should both be 1 meter:
private _stepXat5 = _stepX * 10 ^ ((count _formatX) - 5);
private _stepYat5 = -1 * _stepY * 10 ^ ((count _formatY) - 5);

if (_stepYat5 < 0) then {
    TRACE_1("Northing is reversed",worldName);
};
if (_stepXat5 != 1) then {
    TRACE_2("MGRS 10 digit grid does not equal 1 meter",_stepXat5,worldName);
};
if (_stepYat5 != 1 && {_stepYat5 != -1}) then {
    TRACE_2("MGRS 10 digit grid does not equal 1 meter",_stepYat5,worldName);
};

GVAR(mapGridData) = [_offsetX, _realOffsetY, _stepXat5, _stepYat5];
