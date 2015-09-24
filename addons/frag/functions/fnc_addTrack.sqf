#include "script_component.hpp"

private ["_data", "_index", "_objSpd", "_positions"];

params ["_origin", "_obj", ["_color", [1,0,0,1]]];

if (GVAR(autoTrace)) then {
    [] call FUNC(startTracing);
};

_positions = [];
_objSpd = vectorMagnitude (velocity _obj);
_positions set[(count _positions), [(getPos _obj), _objSpd]];
_data = [_origin, typeOf _origin, typeOf _obj, _objSpd, _positions, _color];

_index = GVAR(traces) pushBack _data;
[FUNC(trackTrace), 0, [_obj, _index, ACE_time]] call CBA_fnc_addPerFrameHandler;
