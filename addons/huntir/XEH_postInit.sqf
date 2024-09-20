#include "script_component.hpp"

GVAR(ZOOM) = 0;
GVAR(NV) = 0;
GVAR(IRON) = false;
GVAR(TI) = 0;
GVAR(cur_cam) = 0;
GVAR(ROTATE) = 0;
GVAR(ELEVAT) = 0.01;

["ace_huntir", {!GETMVAR(GVAR(stop),true)}] call CBA_fnc_registerFeatureCamera;
