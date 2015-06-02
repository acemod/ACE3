#include "script_component.hpp"

GVAR(placer) = objNull;
GVAR(sandBag) = objNull;
GVAR(deployPFH) = -1;
GVAR(deployDirection) = 0;

[{_this call DFUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);
