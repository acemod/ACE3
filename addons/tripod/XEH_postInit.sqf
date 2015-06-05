#include "script_component.hpp"

GVAR(adjuster) = objNull;
GVAR(adjusting) = false;
GVAR(adjustPFH) = -1;

GVAR(height) = 0;

// Cancel adjustment if interact menu opens
["interactMenuOpened", {
    if (GVAR(adjustPFH) != -1 && GVAR(adjusting)) then {
        GVAR(adjusting) = false;
    };
}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(Common,addScrollWheelEventHandler);
