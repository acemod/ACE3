#include "script_component.hpp"

params ["_args"];
_args params ["_tracerObj", "_index"];

if (alive _tracerObj && (count GVAR(traces)) > 0) then {
    private _data = GVAR(traces) select _index;
    private _positions = _data select 4;
    _positions pushBack [(getPos _tracerObj), vectorMagnitude (velocity _tracerObj)];
} else {
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
};
