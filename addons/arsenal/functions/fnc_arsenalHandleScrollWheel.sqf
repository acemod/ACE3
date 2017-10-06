#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["", "_zPos"];

private _distanceMax = ((boundingboxreal GVAR(center) select 0) vectordistance (boundingboxreal GVAR(center) select 1)) * 1.5;
private _distanceMin = _distanceMax * 0.15;
private _distance = GVAR(cameraPosition) select 0;

_distance = (_distance - (_zPos / 10)) max _distanceMin min _distanceMax;
GVAR(cameraPosition) set [0, _distance];