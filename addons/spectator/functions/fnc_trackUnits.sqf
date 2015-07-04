/*
    Author:
    voiper

    Description:
    Check and record tracking for all units.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_trackUnits;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

if (isNil QGVAR(trackingArray)) then {
    GVAR(trackingArray) = [];
};

if (count GVAR(units) < 1) exitWith {};

{
    _unit = _x;
    _pos = getPos _unit;
    _pos resize 2;

    _index = -1;

    {if ((_x select 0) == _unit) then {_index = _forEachIndex}} forEach GVAR(trackingArray);
    if (_index == -1) then {
        GVAR(trackingArray) pushBack [_unit, [_pos]]
    } else {
        _unitArray = GVAR(trackingArray) select _index;
        _trackingArray = _unitArray select 1;
        _latestIndex = (count _trackingArray) - 1;
        _latestPos = _trackingArray select _latestIndex;
        _diffX = abs((_latestPos select 0) - (_pos select 0));
        _diffY = abs((_latestPos select 1) - (_pos select 1));

        if !((_diffX < 20) && (_diffY < 20)) then {
            _trackingArray pushBack _pos;
            _unitArray set [1, _trackingArray];
            GVAR(trackingArray) set [_index, _unitArray];
        };
    };

} forEach GVAR(units);
