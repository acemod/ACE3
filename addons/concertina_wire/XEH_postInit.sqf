#include "script_component.hpp"

GVAR(placer) = objNull;
GVAR(deployPFH) = -1;

// Deploy concertina wire if interact menu is opened
["interactMenuOpened", {
    if (GVAR(deployPFH) != -1) then {
        GVAR(placer) setVariable [QGVAR(wireDeployed), true];
    };
}] call EFUNC(common,addEventHandler);

[QGVAR(vehicleDamage), {_this call FUNC(vehicleDamage)}] call EFUNC(common,addEventHandler);
