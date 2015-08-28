/*
 * Author: Ruthberg
 * Initializes the advanced ballistics dll extension with terrain data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!GVAR(enabled)) exitWith {};
if (!GVAR(extensionAvailable)) exitWith {};

private ["_initStartTime", "_mapSize", "_mapGrids", "_gridCells", "_x", "_y", "_gridCenter", "_gridHeight", "_gridNumObjects", "_gridSurfaceIsWater"];

_initStartTime = ACE_time;
_mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

if (("ace_advanced_ballistics" callExtension format["init:%1:%2", worldName, _mapSize]) == "Terrain already initialized") exitWith {
    #ifdef DEBUG_MODE_FULL
        systemChat "AdvancedBallistics: Terrain already initialized";
    #endIf
};

_mapGrids = ceil(_mapSize / 50) + 1;
_gridCells = _mapGrids * _mapGrids;

GVAR(currentGrid) = 0;

[{
    params ["_args","_idPFH"];
    _args params ["_mapGrids", "_gridCells", "_initStartTime"];

    if (GVAR(currentGrid) >= _gridCells) exitWith {
        #ifdef DEBUG_MODE_FULL
            systemChat format["AdvancedBallistics: Finished terrain initialization in %1 seconds", ceil(ACE_time - _initStartTime)];
        #endif
        [_idPFH] call cba_fnc_removePerFrameHandler;
    };

    for "_i" from 1 to 50 do {
        _x = floor(GVAR(currentGrid) / _mapGrids) * 50;
        _y = (GVAR(currentGrid) - floor(GVAR(currentGrid) / _mapGrids) * _mapGrids) * 50;
        _gridCenter = [_x + 25, _y + 25];
        _gridHeight = round(getTerrainHeightASL _gridCenter);
        _gridNumObjects = count (_gridCenter nearObjects ["Building", 50]);
        _gridSurfaceIsWater = if (surfaceIsWater _gridCenter) then {1} else {0};
        "ace_advanced_ballistics" callExtension format["set:%1:%2:%3", _gridHeight, _gridNumObjects, _gridSurfaceIsWater];
        GVAR(currentGrid) = GVAR(currentGrid) + 1;
        if (GVAR(currentGrid) >= _gridCells) exitWith {};
    };

}, 0, [_mapGrids, _gridCells, _initStartTime]] call CBA_fnc_addPerFrameHandler
