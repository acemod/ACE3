#include "script_component.hpp"

private ["_color", "_data", "_index", "_obj", "_objTVel", "_objVel", "_origin", "_positions"];

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
_objVel = velocity _obj;
_objTVel = sqrt((_objVel select 0)^2 + (_objVel select 1)^2 + (_objVel select 2)^2);
_positions set[(count _positions), [(getPos _obj), _objTVel]];
_data = [_origin, typeOf _origin, typeOf _obj, _objTVel, _positions, _color];

GVAR(traces) set[_index, _data];
[DFUNC(trackTrace), 0, [_obj, _index, time]] call cba_fnc_addPerFrameHandler;
