#include "script_component.hpp"

GVAR(placer) = objNull;
GVAR(sandBag) = objNull;
GVAR(deployPFH) = -1;
GVAR(deployDirection) = 0;

// Cancel deploy sandbag if interact menu opened
["interactMenuOpened", {
    if (GVAR(deployPFH) != -1 && {!isNull (GVAR(sandBag))}) then {
        call FUNC(deployCancel);
    };
}] call EFUNC(common,addEventHandler);

[{_this call FUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);
