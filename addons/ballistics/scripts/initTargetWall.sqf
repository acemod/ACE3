// by commy2
#include "script_component.hpp"

private "_paper";

params ["_wall"];

if (local _wall) then {
    _paper = "UserTexture_1x2_F" createVehicle position _wall;

    _paper attachTo [_wall, [0,-0.02,0.6]];
    _paper setDir getDir _wall;

    _paper setObjectTextureGlobal [0, QUOTE(PATHTOF(textures\target_ca.paa))];
};
