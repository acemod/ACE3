// call compileScript ["z\ace\addons\refuel\dev\exportTerrainRefuelPositions.sqf"]
// can be run in Eden Editor console

#include "\z\ace\addons\refuel\script_component.hpp"

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
            _message = "INCREASE DISTANCE " + str _pos;
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
    {
        _checkCount = _checkCount + count (_x nearObjects [_class, 30]);
    } forEach _positions;
} forEach _basePumps;
if (_checkCount != _totalCount) then {
    _message = "WRONG COUNT " + str _checkCount;
};

// export text
private _nl = toString [10];
private _multipleBasePumps = 1 < count _basePumps;
private _output = [format ["    %1[] = { /*  %2  */", worldName, getText (configfile >> "CfgWorlds" >> worldName >> "description")]];
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
