#include "script_component.hpp"
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
private _mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

if (("ace_advanced_ballistics" callExtension format["init:%1:%2", worldName, _mapSize]) == "Terrain already initialized") exitWith {
    INFO_1("Terrain already initialized [world: %1]", worldName);
    #ifdef DEBUG_MODE_FULL
        systemChat "AdvancedBallistics: Terrain already initialized";
    #endif
};

private _mapGrids = ceil(_mapSize / 50) + 1;
private _gridCells = _mapGrids * _mapGrids;

GVAR(currentGrid) = 0;

// Indexing some maps can be really expensive and slow down game for several minutes, those maps can come with pre-computed data to speed up things
// Data can be realy heavy, to avoid slow down config transversal, isolate it into a specific hierarchy
private _extensionData = configFile >> "AceAdvancedBallistics"  >> worldName  >> "extensionData";
// XXX: For reviewers :
// - Alternative config hierachy to consider : configFile >> "CfgWorlds"  >> worldName >> "AceAdvancedBallistics" >> "extensionData";
// - Add a config to make it optional ? As it does not consider objects added within mission file. Anyway on affected maps performance cost is so high, I think it's not required
if ( isArray _extensionData ) exitWith {
    INFO_2("Starting Terrain Extension using pre-computed data from config [cells: %1] [world: %2]", _gridCells, worldName);
	{
		"ace_advanced_ballistics" callExtension format (["set:%1:%2:%3"] + _x);
	} forEach (getArray _extensionData);
    GVAR(currentGrid) = _gridCells; // Some third party scripts may rely on this global variable
    INFO_2("Finished terrain initialization in %1 seconds [world: %2]", (diag_tickTime - _initStartTime) toFixed 2, worldName);
};

INFO_2("Starting Terrain Extension [cells: %1] [world: %2]", _gridCells, worldName);

[{
    params ["_args","_idPFH"];
    _args params ["_mapGrids", "_gridCells", "_initStartTime"];

    if (GVAR(currentGrid) >= _gridCells) exitWith {
        INFO_2("Finished terrain initialization in %1 seconds [world: %2]", (diag_tickTime - _initStartTime) toFixed 2, worldName);
        #ifdef DEBUG_MODE_FULL
            systemChat format["AdvancedBallistics: Finished terrain initialization in %1 seconds", (diag_tickTime - _initStartTime) toFixed 2];
        #endif
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    for "_i" from 1 to 50 do {
        private _x = floor(GVAR(currentGrid) / _mapGrids) * 50;
        private _y = (GVAR(currentGrid) - floor(GVAR(currentGrid) / _mapGrids) * _mapGrids) * 50;
        private _gridCenter = [_x + 25, _y + 25];
        private _gridHeight = round(getTerrainHeightASL _gridCenter);
        private _gridNumObjects = count (_gridCenter nearObjects ["Building", 50]);
        private _gridSurfaceIsWater = if (surfaceIsWater _gridCenter) then {1} else {0};
        "ace_advanced_ballistics" callExtension format["set:%1:%2:%3", _gridHeight, _gridNumObjects, _gridSurfaceIsWater];
        GVAR(currentGrid) = GVAR(currentGrid) + 1;
        if (GVAR(currentGrid) >= _gridCells) exitWith {};
    };

}, 0, [_mapGrids, _gridCells, _initStartTime]] call CBA_fnc_addPerFrameHandler
