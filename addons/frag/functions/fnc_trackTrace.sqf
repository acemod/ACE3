#include "script_component.hpp"

private ["_positions", "_data"];
params ["_args", "_idPFH"];
_args params ["_tracerObj", "_index"];

if (alive _tracerObj && (count GVAR(traces)) > 0) then {
    _data = GVAR(traces) select _index;
    _positions = _data select 4;
    _positions set [(count _positions), [(getPos _tracerObj), vectorMagnitude (velocity _tracerObj)]];
} else {
    [_idPFH] call cba_fnc_removePerFrameHandler;
};
