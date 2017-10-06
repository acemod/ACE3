#include "script_component.hpp"
#include "..\defines.hpp"

GVAR(cameraPosition)  params ["_distance", "_dirH", "_dirV"];
[GVAR(cameraHelper), [_dirH + 360, - _dirV, 0]] call bis_fnc_setobjectrotation;
GVAR(cameraHelper) attachTo [GVAR(center), GVAR(cameraPosition) select 3, ""]; //--- Reattach for smooth movement

GVAR(camera) setPos (GVAR(cameraHelper) modelToWorld [0, -_distance, 0]);
GVAR(camera) setVectorDirAndUp [vectorDir GVAR(cameraHelper), vectorUp GVAR(cameraHelper)];

//--- Make sure the camera is not underground
if ((getPosAsl GVAR(camera) select 2) < (getPosAsl GVAR(center) select 2)) then {
    private _disCoef = ((getPosAsl GVAR(cameraHelper) select 2) - (getPosAsl GVAR(center) select 2)) / ((getPosAsl GVAR(cameraHelper) select 2) - (getPosAsl GVAR(camera) select 2) + 0.001);
    GVAR(camera) setPos (GVAR(cameraHelper) modelToWorldVisual [0, -_distance * _disCoef, 0]);
};