#include "\z\ace\addons\refuel\script_component.hpp"

// call compileScript ["z\ace\addons\refuel\dev\exportTerrainRefuelPositions.sqf"]
// copies to clipboard header and positions
// returns total found feed and position count, messages and output
// can run in Eden Editor console

// use this command to move player to needed position:
// player setPos [15121,19011];
// use this command to view fuel feeds around player position
// ["f", {count (getPos player nearObjects ["Land_fs_feed_F", 30])}] call ace_common_fnc_watchVariable;

{
    if (!isArray (configFile >> QGVAR(positions) >> configName _x)) then {
        WARNING_1("need configs on [%1]",configName _x);
    };
} forEach ("true" configClasses (configFile >> "CfgWorldList"));



private _basePumps = [];
private _totalCount = 0;
private _posCount = 0;
private _message = "";
private _halfWorldSize = worldSize / 2;
private _worldCenter = [_halfWorldSize, _halfWorldSize];
_halfWorldSize = _halfWorldSize * sqrt 2;

private _baseStaticClasses = keys (uiNamespace getVariable QGVAR(cacheRefuelClassesBaseStatic));
private _class = "";
private _objects = [];
private _positions = [];
private _object = objNull;
private _pos = [];

{
    _class = _x;
    _objects = _worldCenter nearObjects [_class, _halfWorldSize];
    if (_objects isEqualTo []) then {
        continue;
    };
    ADD(_totalCount,count _objects);
    _positions = [];
    {
        _object = _x;
        _pos = ASLToAGL getPosASL _object;
        if (-1 < _positions findIf {60 > _x distance _pos && {20 < _x distance _pos}}) then {
            _message = "INCREASE SEARCH DISTANCE " + str _pos;
        };
        if (-1 == _positions findIf {20 > _x distance _pos}) then {
            _positions pushBack (_pos apply {round _x});
            INC(_posCount);
        };
    } forEach _objects;
    _positions sort true; // sort positions by smallest first
    _basePumps pushBack [_class, _positions];
} forEach _baseStaticClasses;

_basePumps sort true; // sort pump classes alphabetically

// check final array as it's calculated in postInit
private _checkCount = 0;
{
    _x params ["_class", "_positions"];
    private _pumps = [];
    {
        _pumps append (_x nearObjects [_class, 30]);
    } forEach _positions;
    _pumps = _pumps arrayIntersect _pumps;
    _checkCount = _checkCount + count _pumps;
} forEach _basePumps;
if (_checkCount != _totalCount) then {
    _message = "WRONG COUNT " + str _checkCount;
};

private _cfgPositions = configFile >> QGVAR(positions) >> worldName;
if (isArray _cfgPositions) then {
    private _currentPositionsPumps = [];
    {
        _x params ["_class", "_positions"];
        {
            _currentPositionsPumps insert [-1, _x nearObjects [_class, 30], true];
        } forEach _positions;
    } forEach getArray _cfgPositions;
    if (_checkCount != count _currentPositionsPumps) then {
        _message = "WRONG CURRENT " + str count _currentPositionsPumps;
    };
};

// export text
private _nl = toString [10];
private _multipleBasePumps = 1 < count _basePumps;
private _output = [format ["    %1[] = { /*  %2  */", worldName, getText (configFile >> "CfgWorlds" >> worldName >> "description")]];
{
    if (_forEachIndex > 0) then {_output pushBack ","};
    _x params ["_class", "_positions"];
    if (_multipleBasePumps) then {
        _output pushBack (_nl + "        ");
    } else {
        _output pushBack " ";
    };
    _output pushBack format ["{""%1"", {", _class];
    {
        if (_forEachIndex > 0) then {_output pushBack ","};
        _output pushBack format ["{%1,%2,%3}", _x#0, _x#1, _x#2];
    } forEach _positions;
    _output pushBack "}}";
} forEach _basePumps;
if (_multipleBasePumps) then {_output pushBack (_nl + "    ")};
if (_basePumps isEqualTo []) then {_output pushBack " "};
_output pushBack ("};" + _nl);

_output = _output joinString "";

copyToClipboard _output;
[_totalCount, _posCount, _message, _output]
