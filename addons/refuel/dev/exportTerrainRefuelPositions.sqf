// call compile preprocessFileLineNumbers "z\ace\addons\refuel\dev\exportTerrainRefuelPositions.sqf"
// can be run in Eden Editor console

#include "\z\ace\addons\refuel\script_component.hpp"

private _basePumps = [];
private _totalCount = 0;
private _posCount = 0;
private _message = "";
private _worldSize = worldSize;
private _worldCenter = [_worldSize / 2, _worldSize / 2];

private _baseStaticClasses = call (uiNamespace getVariable QGVAR(cacheRefuelClasses)) select 1;

{
    private _class = _x;
    private _objects = _worldCenter nearObjects [_class, _worldSize];
    if !(_objects isEqualTo []) then {
        ADD(_totalCount,count _objects);
        private _positions = [];
        {
            private _object = _x;
            private _pos = ASLToAGL getPosASL _object;
            if (-1 < _positions findIf {60 > _x distance _pos && {20 < _x distance _pos}}) then {
                _message = "INCREASE DISTANCE " + str _pos;
            };
            if (-1 == _positions findIf {20 > _x distance _pos}) then {
                _positions pushBack (_pos apply {parseNumber (_x call CBA_fnc_formatNumber)});
                INC(_posCount);
            };
        } forEach _objects;
        _basePumps pushBack [_class, _positions];
    };
} forEach _baseStaticClasses;

// check final array as it's calculated in postInit
private _checkCount = 0;
{
    _x params ["_class", "_positions"];
    {
        _checkCount = _checkCount + count (_x nearObjects [_class, 30]);
    } forEach _positions;
} forEach _basePumps;
if (_checkCount < _totalCount) then {
    _message = "WRONG COUNT " + str _checkCount;
};

// export text
private _nl = toString [10];
private _output = format ["    %1[] = { /*  %2  */", worldName, getText (configfile >> "CfgWorlds" >> worldName >> "description")];
{
    if (_forEachIndex > 0) then {_output = _output + ","};
    _x params ["_class", "_positions"];
    if (1 < count _basePumps) then {
        ADD(_output,_nl + "        ");
    } else {
        ADD(_output," ");
    };
    _output = _output + format ["{""%1"", {", _class];
    {
        if (_forEachIndex > 0) then {_output = _output + ","};
        _output = _output + format ["{%1,%2,%3}", _x#0, _x#1, _x#2];
    } forEach _positions;
    ADD(_output,"}}");
} forEach _basePumps;
if (1 < count _basePumps) then {ADD(_output,_nl + "    ")};
if (_basePumps isEqualTo []) then {ADD(_output," ")};
ADD(_output,"};" + _nl);

copyToClipboard _output;
[_totalCount, _posCount, _message, _output]
