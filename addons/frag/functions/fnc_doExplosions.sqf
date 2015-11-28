//fnc_doExplosions.sqf
#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_explosions", "_index"];

for "_i" from _index to ((_index + 2) min (count _explosions)) do {

    (_explosions select _i) params ["_refExp", "_bpos", "_hit", "_distance", "_indirectHitRange", "_depth"];

    _refExp createVehicle (ASLtoATL _bpos);
};
_index = _index + 2;

if(_index >= (count _explosions)) then {
    [_idPFH] call cba_fnc_removePerFrameHandler;
} else {
    (_this select 0) set [1, _index];
};
