#include "script_component.hpp"

GVAR(placer) = objNull;
GVAR(deployPFH) = -1;

// Deploy concertina wire if interact menu is opened
["ace_interactMenuOpened", {
    if (GVAR(deployPFH) != -1) then {
        GVAR(placer) setVariable [QGVAR(wireDeployed), true];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(vehicleDamage), {_this call FUNC(vehicleDamage)}] call CBA_fnc_addEventHandler;
