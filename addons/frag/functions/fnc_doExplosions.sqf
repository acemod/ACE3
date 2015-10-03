//fnc_doExplosions.sqf
#include "script_component.hpp"

private ["_params", "_explosions", "_index", "_i", "_exp", "_refExp", "_bpos", "_hit", "_distance", "_indirectHitRange", "_depth"];
_params = _this select 0;
_explosions = _params select 0;
_index = _params select 1;
for "_i" from _index to ((_index+2) min (count _explosions)) do {
    _exp = _explosions select _i;
    _refExp = _exp select 0;
    _bpos = _exp select 1;
    _hit = _exp select 2;
    _distance = _exp select 3;
    _indirectHitRange = _exp select 4;
    _depth = _exp select 5;
    _refExp createVehicle (ASLtoATL _bpos);
    // if(_hit >= 150 && _distance > _indirectHitRange) then {
        // [_bpos, _refExp, _depth] call FUNC(doReflections);
    // };
};
_index = _index + 2;
if(_index >= (count _explosions)) then {
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
} else {
    _params set[1, _index];
};
