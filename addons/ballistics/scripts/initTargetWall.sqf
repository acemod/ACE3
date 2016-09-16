// by commy2
#include "script_component.hpp"

params ["_wall"];

if (local _wall) then {
    private _paper = "UserTexture_1x2_F" createVehicle position _wall;

    _paper attachTo [_wall, [0,-0.02,0.6]];
    _paper setDir getDir _wall;

    _paper setObjectTextureGlobal [0, QPATHTOF(textures\target_ca.paa)];
};
