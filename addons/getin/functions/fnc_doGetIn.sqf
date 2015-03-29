#include "script_component.hpp"

PARAMS_3(_target,_player,_args);
EXPLODE_3_PVT(_args,_position,_memPoint,_seatInfo);

//Double Check Conditional
if (!(_this call FUNC(canGetIn))) exitWith {ERROR("Bad check canGetIn");};

systemChat format ["Getting In %1", _args];

if (_position == "driver") then {
    _player action ["getInDriver", _target];
} else {
    if (_position == "turret") then {
        _player action ["getInTurret", _target, _seatInfo];
    } else {
        if (_position == "cargo") then {
            _freeSeat = [_target, _seatInfo] call FUNC(getEmptyCargoSeat);
            _player action ["getInCargo", _target, _freeSeat];
        };
    };
};
