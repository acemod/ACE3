#include "script_component.hpp"

private _params = _this select 0;
_params params ["_tracerObj", "_index"];

if (alive _tracerObj && (count GVAR(traces)) > 0) then {
    private _data = GVAR(traces) select _index;
    private _positions = _data select 4;
    _positions set [(count _positions), [(getPos _tracerObj), vectorMagnitude (velocity _tracerObj)]];
} else {
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
};
