#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Dig trenchline
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Position <ARRAY>
 * 2: Force - ignoring saftey checks (optional: false) <BOOL>
 * 3: Cut Grass (optional: false) <BOOL>
 * 4: Dry Run - Just test if possible (can run on clients) <BOOL>
 *
 * Return Value:
 * <ARRAY>
 * 0: Success <BOOL>
 * 1: Failure reason <STRING>
 * 2: Extra info <ANY>
 *
 * Example:
 * [a, b] call ace_trenches_fnc_blockTrench_place
 *
 * Public: No
 */

params [["_start2d", [], [[]]], ["_end2d", [], [[]]], ["_force", false, [false]], ["_cutGrass", false, [false]], ["_dryRun", false, [false]]];
TRACE_4("blockTrench_place",_start2d,_end2d,_force,_dryRun);

if ((!isServer) && {!_dryRun}) exitWith { ERROR("function must be called on server"); [false, "server-only"]; };

scopeName "main";

// get maths
getTerrainInfo params ["", "", "_cellsize"];
if ((_cellsize < 1) || {_cellsize > 10}) exitWith { [false, "world cellsize"] breakOut "main" }; // malden is 12.5

// for Land_Trench_01_forest_F
private _modelX = 2.1;
private _modelZ = 1.1;
private _modelSize = 3.75;

private _landAdjust = -1.7; // how deep we dig into the terrain
private _trenchDepth = -1; // how deep the floor is
private _trenchWidth = 1; // offset for each side from center
private _blockAdjust = -0.45; // get block to sit flush
private _blockScale = _cellsize / _modelSize; // scale up block to fit cellsize

private _xOffset = _trenchWidth + _blockScale * _modelX;
private _zOffset = _blockAdjust - (_blockScale - 1) * _modelZ;
private _testRadius = 1 * _blockScale * _modelSize;

// convert to terrain grid
_start2d = (_start2d select [0,2]) apply {_cellsize * round (_x / _cellsize)};
_end2d = (_end2d select [0,2]) apply {_cellsize * round (_x / _cellsize)};
_start2d params ["_ax", "_ay"];
_end2d params ["_bx", "_by"];
{   // make sure points aren't outside terrain
    if (_x < _cellsize || {_x > (worldSize - _cellsize)}) exitWith { [false, "outside map boundry"] breakOut "main" };
} forEach [_ax, _ay, _bx, _by];
TRACE_3("adjusted",_cellsize,_start2d,_end2d);

// get direction and start/end
private _east = (abs (_ax - _bx)) >= (abs (_ay - _by));
private _origin2D = [];
private _length = 0;
if (_east) then {
    _origin2D = [_end2d, _start2d] select (_ax < _bx);
    _length = (abs (_ax - _bx)) / _cellsize;
} else {
    _origin2D = [_end2d, _start2d] select (_ay < _by);
    _length = (abs (_ay - _by)) / _cellsize;
};
TRACE_3("",_east,_origin2D,_length);
if (_length < 2) exitWith { [false, "too short"] breakOut "main" };

if (_dryRun) exitWith { // return an array of block positions
    private _positions = [];
    for "_i" from 0 to _length do { // intentionally inclusive
        _positions pushBack (_origin2D vectorAdd (if (_east) then {[(_i + 0.5) * _cellsize, 0]} else {[0, (_i + 0.5) * _cellsize]}));
    };
    [true, "dry run", _positions]
};


// Test and get block data
private _blockData = [];
for "_i" from 0 to _length do { // intentionally inclusive
    private _posCenter = _origin2D;
    private _posLeft = _origin2D;
    private _posRight = _origin2D;
    private _direction = [];
    if (_east) then {
        _posCenter = _posCenter vectorAdd [(_i + 0.5) * _cellsize, 0];
        _posLeft = _posCenter vectorAdd [0, _xOffset];
        _posRight = _posCenter vectorAdd [0, -_xOffset];
        _direction = [0,-1,0];
    } else {
        _posCenter = _posCenter vectorAdd [0, (_i + 0.5) * _cellsize];
        _posLeft = _posCenter vectorAdd [_xOffset, 0];
        _posRight = _posCenter vectorAdd [-_xOffset, 0];
        _direction = [-1,0,0];
    };

    {   // Test if each point is valid
        private _pos2d = _x;
        // check water
        if ((!_force) && {(getTerrainHeightASL _pos2D) < 0}) then { [false, "water"] breakOut "main" };
        // check canDig (surface type)
        if ((!_force) && {!([_pos2d] call EFUNC(common,canDig))}) then { [false, "canDig surface"] breakOut "main" };
        // check canDig (surface type)
        if ((!_force) && {isOnRoad _pos2D}) then { [false, "road"] breakOut "main" };
        // check terrain objects
        private _terrainObjects = nearestTerrainObjects [_pos2d, [], _testRadius, false, true];
        // todo: want to avoid touching trees and large rocks but could allow some small shrubs to be overlapped
        if (_terrainObjects isNotEqualTo []) then {
            if (_force) then {
                WARNING_1("overlapping terrainObjects %1",_terrainObjects);
            } else {
                [false, "terrain object", _terrainObjects] breakOut "main";
            };
        };
        // check mission objects
        private _missionObjects = nearestObjects [_origin2D, ["All"], _testRadius, true];
        _missionObjects = _missionObjects select { !(_x isKindOf "Logic") };
        if (_missionObjects isNotEqualTo []) then {
            _missionObjects = _missionObjects apply {typeOf _x};
            if (_force) then {
                WARNING_1("blocking missionObjects %1",_missionObjects);
            } else {
                [false, "mission object", _missionObjects] breakOut "main";
            };
        };
    } forEach [_posCenter, _posLeft, _posRight];

    _posCenter set [2, (getTerrainHeightASL _posCenter) + _zOffset + _trenchDepth];
    _posLeft set [2, (getTerrainHeightASL _posLeft) + _zOffset];
    _posRight set [2, (getTerrainHeightASL _posRight) + _zOffset];

    if (_cutGrass && {_i != 0} && {_i != _length}) then {
        _blockData pushBack ["Land_ClutterCutter_medium_F", _blockScale, _posCenter, [0,1,0], surfaceNormal _posCenter];
    };
    // todo: there also is a snow textured block or do it right and make our own re-texturable model
    _blockData pushBack ["Land_Trench_01_forest_F", _blockScale, _posCenter, _direction, surfaceNormal _posCenter];
    _blockData pushBack ["Land_Trench_01_forest_F", _blockScale, _posLeft, _direction, surfaceNormal _posLeft];
    _blockData pushBack ["Land_Trench_01_forest_F", _blockScale, _posRight, _direction vectorMultiply -1, surfaceNormal _posRight];
};


// Adjust terrain heights
private _terrainData = [];
for "_i" from 1 to (_length - 1) do { // skip first and last
    private _posCenter = _origin2D;
    if (_east) then {
        _posCenter = _posCenter vectorAdd [_i * _cellsize, 0];
    } else {
        _posCenter = _posCenter vectorAdd [0, _i * _cellsize];
    };

    _posCenter set [2, (getTerrainHeight _posCenter) + _landAdjust];
    _terrainData pushBack _posCenter
};
TRACE_1("setTerrainHeight",count _terrainData);
setTerrainHeight [_terrainData, true];


// Place blocks
{
    _x params ["_xClass", "_xScale", "_xPosASL", "_xDir", "_xUp"];
    private _block = createSimpleObject [_xClass, _xPosASL];
    _block setVectorDirAndUp [_xDir, _xUp];
    if (_xScale != 1) then { _block setObjectScale _xScale; };
} forEach _blockData;

[true, "", _length]
