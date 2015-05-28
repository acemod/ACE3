#include "script_component.hpp"

private ["_color", "_data", "_index", "_obj", "_objSpd", "_origin", "_positions"];

if (GVAR(autoTrace)) then {
    [] call FUNC(startTracing);
};

// setAccTime 0.05;
_index = (count GVAR(traces));
_obj = _this select 1;
_origin = _this select 0;
_color = [1,0,0,1];
if((count _this) > 2) then {
    _color = _this select 2;
};
_positions = [];
_objSpd = vectorMagnitude (velocity _obj);
_positions set[(count _positions), [(getPos _obj), _objSpd]];
_data = [_origin, typeOf _origin, typeOf _obj, _objSpd, _positions, _color];

GVAR(traces) set[_index, _data];
[DFUNC(trackTrace), 0, [_obj, _index, ACE_time]] call cba_fnc_addPerFrameHandler;
