#include "script_component.hpp"

GVAR(ladder) = objNull;
GVAR(cancelTime) = 0;
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

// Cancel tactical ladder deployment if the interact menu is opened
["interactMenuOpened", {
    if ((ACE_time > GVAR(cancelTime)) && !isNull GVAR(ladder)) then {
        GVAR(ladder) call FUNC(cancelTLdeploy);
    };
}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(Common,addScrollWheelEventHandler);
