/*
 * Author: Ruthberg
 * Initializes the advanced ballistics dll extension with terrain data
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

[] spawn {
    private ["_initStartTime", "_mapSize", "_mapGrids", "_gridCenter", "_gridHeight", "_gridNumObjects", "_gridSurfaceIsWater"];
    
    _initStartTime = time;
    _mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
    
    if (("ace_advanced_ballistics" callExtension format["init:%1:%2", worldName, _mapSize]) == "Terrain already initialized") exitWith {
        if (GVAR(INIT_MESSAGE_ENABLED)) then {
            systemChat "AdvancedBallistics: Terrain already initialized";
        };
    };
    
    _mapGrids = ceil(_mapSize / 50);
    
    for "_x" from 0 to _mapGrids * 50 step 50 do {
        for "_y" from 0 to _mapGrids * 50 step 50 do {
            _gridCenter = [_x + 25, _y + 25];
            _gridHeight = round(getTerrainHeightASL _gridCenter);
            _gridNumObjects = count (_gridCenter nearObjects ["Building", 50]);
            _gridSurfaceIsWater = if (surfaceIsWater _gridCenter) then {1} else {0};
            "ace_advanced_ballistics" callExtension format["set:%1:%2:%3", _gridHeight, _gridNumObjects, _gridSurfaceIsWater];
        };
        sleep 0.001;
    };
    
    if (GVAR(INIT_MESSAGE_ENABLED)) then {
        systemChat format["AdvancedBallistics: Finished terrain initialization in %1 seconds", ceil(time - _initStartTime)];
    };
};
