#include "script_component.hpp"

// Manually update weapon lights once for instant change
// TODO: Check if still necessary?
if (IN_NVGS) then {
    {
        _x action ["GunLightOn", _x];
    } forEach GVAR(units);
} else {
    {
        _x action ["GunLightOff", _x];
    } forEach GVAR(units);
};
