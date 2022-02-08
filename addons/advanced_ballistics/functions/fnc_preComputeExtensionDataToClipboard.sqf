#include "script_component.hpp"
/*
 * Author: GrueArbre/jetelain
 * Precompute the advanced ballistics extension data and copy it to clipboard
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_preComputeExtensionDataToClipboard
 *
 * Public: Yes
 */

private _initStartTime = diag_tickTime;
private _mapSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
private _mapGrids = ceil(_mapSize / 50) + 1;
private _gridCells = _mapGrids * _mapGrids;
private _currentGrid = 0;
private _data = [];
while { _currentGrid < _gridCells } do {

	private _x = floor(_currentGrid / _mapGrids) * 50;
	private _y = (_currentGrid - floor(_currentGrid / _mapGrids) * _mapGrids) * 50;
	private _gridCenter = [_x + 25, _y + 25];
	private _gridHeight = round(getTerrainHeightASL _gridCenter);
	private _gridNumObjects = count (_gridCenter nearObjects ["Building", 50]);
	private _gridSurfaceIsWater = if (surfaceIsWater _gridCenter) then {1} else {0};
	_data pushBack [_gridHeight, _gridNumObjects, _gridSurfaceIsWater];
	_currentGrid = _currentGrid + 1;
	if ( _currentGrid mod 100 == 0 ) then {
		systemChat format["%1%2", (_currentGrid * 100 / _gridCells) toFixed 2, "%"];
	};
};
copyToClipboard str _data;
systemChat format["Done in %1 seconds", (diag_tickTime - _initStartTime) toFixed 2];