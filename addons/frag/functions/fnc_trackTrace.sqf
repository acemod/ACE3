#include "script_component.hpp"

private ["_params", "_tracerObj", "_index", "_positions", "_data"];
_params = _this select 0;
_tracerObj = _params select 0;
_index = _params select 1;

if (alive _tracerObj && (count GVAR(traces)) > 0) then {
    _data = GVAR(traces) select _index;
    _positions = _data select 4;
    _positions set [(count _positions), [(getPos _tracerObj), vectorMagnitude (velocity _tracerObj)]];
} else {
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};
