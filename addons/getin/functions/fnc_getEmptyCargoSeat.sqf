#include "script_component.hpp"

PARAMS_2(_target,_cargoIndexesToTest);
_crewInfoFull = fullCrew _target;
_returnValue = -1;
{
    _seatToCheck = _x;
    if (({(_x select 2) == _seatToCheck} count _crewInfoFull) == 0) exitWith {_returnValue = _x};
} forEach _cargoIndexesToTest;

_returnValue
