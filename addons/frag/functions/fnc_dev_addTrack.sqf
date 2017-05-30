#include "script_component.hpp"

params ["_origin", "_obj", ["_color", [1, 0, 0, 1]]];

private _positions = [];
private _objSpd = vectorMagnitude (velocity _obj);
_positions pushBack [getPos _obj, _objSpd];
private _data = [_origin, typeOf _origin, typeOf _obj, _objSpd, _positions, _color];

private _index = GVAR(traces) pushBack _data;
[DFUNC(dev_trackTrace), 0, [_obj, _index, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
