/*
    Author:
    voiper

    Description:
    Killed EH for remote units.

    Arguments:
    0: Unit <Object>
    1: Killer <Object>

    Example:
    [unit, killer] call ace_spectator_fnc_killed;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_unit = _this select 0;
_killer = _this select 1;

if (isNil "_unit") exitWith {};
if (isNil QGVAR(cam)) exitWith {};
if (isNull _unit) exitWith {};

if (!isNull _killer) then {
    if (GVAR(markers) > 2 && !difficultyEnabled "deathMessages") then {
        _nameUnit = name _unit;
        _nameKiller = name _killer;
        
        _text = if (_killer == _unit) then {
            format ["%1 died", _nameUnit]
        } else {
            format ["%2 killed by %1", _nameUnit, _nameKiller]
        };
        systemChat _text;
    };
};

if (_unit == GVAR(unit) && !GVAR(cameraOn)) then {
    ["Camera", ["Free"]] call FUNC(camera);
    GVAR(unit) = objNull;
};

_savedUnit = GVAR(savedUnits) find _unit;
if (_savedUnit > -1) then {
    GVAR(savedUnits) set [_savedUnit, objNull];
};

if (!isNil QGVAR(trackingArray)) then {
    _pos = getPos _unit;
    _pos resize 2;
    _index = -1;
    {if ((_x select 0) == _unit) then {_index = _forEachIndex}} forEach GVAR(trackingArray);
    _unitArray = GVAR(trackingArray) select _index;
    _tracks = _unitArray select 1;
    _tracks pushBack _pos;
    _unitArray set [1, _tracks];
    GVAR(trackingArray) set [_index, _unitArray];
};