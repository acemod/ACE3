/*

by commy2

Handles releasing the special vector keys.

*/
#include "script_component.hpp"

switch (_this select 0) do {
    case ("azimuth"): {

        GVAR(isKeyDownAzimuth) = false;

    };

    case ("distance"): {

        GVAR(isKeyDownDistance) = false;

    };
};
