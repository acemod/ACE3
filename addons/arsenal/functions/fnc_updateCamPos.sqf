#include "script_component.hpp"
#include "..\defines.hpp"

GVAR(cameraPosition)  params ["_distance", "_dirH", "_dirV"];
[GVAR(cameraHelper), [_dirH + 180, - _dirV, 0]] call bis_fnc_setobjectrotation;
GVAR(cameraHelper) attachTo [GVAR(center), GVAR(cameraPosition) select 3, ""]; //--- Reattach for smooth movement

GVAR(camera) setPos (GVAR(cameraHelper) modelToWorld [0, -_distance, 0]);
GVAR(camera) setVectorDirAndUp [vectorDir GVAR(cameraHelper), vectorUp GVAR(cameraHelper)];

//--- Make sure the camera is not underground
if ((getPosAsl GVAR(camera) select 2) < (getPosAsl GVAR(center) select 2)) then {
    private _disCoef = ((getPosAsl GVAR(cameraHelper) select 2) - (getPosAsl GVAR(center) select 2)) / ((getPosAsl GVAR(cameraHelper) select 2) - (getPosAsl GVAR(camera) select 2) + 0.001);
    GVAR(camera) setPos (GVAR(cameraHelper) modelToWorldVisual [0, -_distance * _disCoef, 0]);
};

if (is3DEN) then {
    for "_x" from -5 to 5 step 1 do {
        drawLine3D [
            GVAR(sphere) modelToWorld [_x, -5, 0],
            GVAR(sphere) modelToWorld [_x, +5, 0],
            [0.03, 0.03, 0.03, 1]
        ];
    };
    for "_y" from -5 to 5 step 1 do {
        drawLine3D [
            GVAR(sphere) modelToWorld [-5, _y, 0],
            GVAR(sphere) modelToWorld [+5, _y, 0],
            [0.03, 0.03, 0.03, 1]
        ];
    };
};