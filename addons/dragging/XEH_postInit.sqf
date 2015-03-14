// by PabstMirror

#include "script_component.hpp"

GVAR(currentHeightChange) = 0;

[{_this call DFUNC(handleScrollWheel)}] call FUNC(common,addScrollWheelEventHandler);

if (isNil QGVAR(maxWeight)) then {
    GVAR(maxWeight) = 800;
};
