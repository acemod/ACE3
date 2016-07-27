#include "script_component.hpp"

GVAR(ZOOM) = 0;
GVAR(NV) = 0;
GVAR(IRON) = false;
GVAR(TI) = 0;
GVAR(cur_cam) = 0;
GVAR(ROTATE) = 0;
GVAR(ELEVAT) = 0.01;

// Register fire event handler
// Don't run for non players, as they are too dumb to launch huntirs anyway
[QGVAR(huntirFired), DFUNC(handleFired)] call CBA_fnc_addEventHandler;

[QGVAR(huntirFired), {
    params ["_ammo", "_ammoConfig"];
    hasInterface && (_ammo == "F_HuntIR")
}, true, false, false, false, false, false] call EFUNC(common,registerAmmoFiredEvent);
