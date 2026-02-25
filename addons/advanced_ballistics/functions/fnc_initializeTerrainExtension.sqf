#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Initializes the advanced ballistics extension with terrain data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_initializeTerrainExtension
 *
 * Public: No
 */

if (!hasInterface) exitWith {};
if (!GVAR(enabled)) exitWith {};

private _initStartTime = diag_tickTime;
private _mapSize = worldSize;

("ace" callExtension ["ballistics:map:init", [worldName, _mapSize]]) params ["_data", "_code"];

if (_code != 0) exitWith {
    ERROR("Error initializing map")
};

if (_data == "true") exitWith {
    INFO_1("Terrain already initialized [world: %1]",worldName);
    #ifdef DEBUG_MODE_FULL
        systemChat "AdvancedBallistics: Terrain already initialized";
    #endif
};

private _mapGrids = ceil (_mapSize / 50) + 1;
private _gridCells = _mapGrids * _mapGrids;

GVAR(currentGrid) = 0;

INFO_2("Starting Terrain Extension [cells: %1] [world: %2]",_gridCells,worldName);

[{
    params ["_args", "_idPFH"];
    _args params ["_mapGrids", "_gridCells", "_initStartTime"];

    if (GVAR(currentGrid) >= _gridCells) exitWith {
        INFO_2("Finished terrain initialization in %1 seconds [world: %2]",(diag_tickTime - _initStartTime) toFixed 2,worldName);
        #ifdef DEBUG_MODE_FULL
            systemChat format ["AdvancedBallistics: Finished terrain initialization in %1 seconds", (diag_tickTime - _initStartTime) toFixed 2];
        #endif
        _idPFH call CBA_fnc_removePerFrameHandler;
    };

    for "_i" from 1 to 50 do {
        private _x = floor (GVAR(currentGrid) / _mapGrids) * 50;
        private _y = (GVAR(currentGrid) - floor (GVAR(currentGrid) / _mapGrids) * _mapGrids) * 50;

        private _gridCenter = [_x + 25, _y + 25];
        private _gridHeight = round getTerrainHeightASL _gridCenter;
        private _gridBuildingCount = {
            private _bb = boundingBoxReal [_x, "ViewGeometry"];
            private _height = _bb#1#2 - _bb#0#2;
            private _volume = (_bb#1#0 - _bb#0#0) * (_bb#1#1 - _bb#0#1) * _height;

            (_height > 0.3) && {_volume > 10}
        } count (_gridCenter nearObjects ["Building", 50]);
        private _gridTreeCount = count nearestTerrainObjects [_gridCenter, ["TREE"], 50, false];
        private _roughnessIndex = _gridBuildingCount + round (_gridTreeCount / 9);

        "ace" callExtension ["ballistics:map:set", [GVAR(currentGrid), _gridHeight, _roughnessIndex, surfaceIsWater _gridCenter]];
        GVAR(currentGrid) = GVAR(currentGrid) + 1;
        if (GVAR(currentGrid) >= _gridCells) exitWith {};
    };
}, 0, [_mapGrids, _gridCells, _initStartTime]] call CBA_fnc_addPerFrameHandler
