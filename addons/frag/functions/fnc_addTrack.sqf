#include "script_component.hpp"

if (GVAR(autoTrace)) then {
    [] call FUNC(startTracing);
};

// setAccTime 0.05;
private _index = count GVAR(traces);
params ["_origin", "_obj"];
private _color = [1,0,0,1];
if((count _this) > 2) then {
    _color = _this select 2;
};
private _positions = [];
private _objSpd = vectorMagnitude (velocity _obj);
_positions set[(count _positions), [(getPos _obj), _objSpd]];
private _data = [_origin, typeOf _origin, typeOf _obj, _objSpd, _positions, _color];

GVAR(traces) set[_index, _data];
[DFUNC(trackTrace), 0, [_obj, _index, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
