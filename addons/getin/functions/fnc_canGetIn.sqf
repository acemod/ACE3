#include "script_component.hpp"

PARAMS_3(_target,_player,_args);
EXPLODE_3_PVT(_args,_position,_memPoint,_seatInfo);

_roomInPosition = false;

if (_position == "driver") then {
    _roomInPosition = isNull (driver _target);
} else {
    if (_position == "turret") then {
        _roomInPosition = isNull (_target turretUnit _seatInfo);
    } else {
        if (_position == "cargo") then {
            _freeSeat = [_target, _seatInfo] call FUNC(getEmptyCargoSeat);
            _roomInPosition = (_freeSeat != -1);
        };
    };
};

// systemChat format ["%1 = _%2", _args, _roomInPosition];

_roomInPosition &&
{alive _target} &&
{(locked _target) == 0} &&
{(_player distance (_target modelToWorld (_target selectionPosition _memPoint))) < 3.5}
